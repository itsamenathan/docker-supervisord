FROM ubuntu:latest
MAINTAINER Nathan W "nathan@frcv.net"

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list \
    && apt-get --quiet --yes  update \
    && apt-get --quiet --yes  install supervisor nginx openssh-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists \
    && mkdir -p /var/log/supervisor \
    && echo "root:password" | chpasswd

ADD supervisor /etc/supervisor
ADD runscripts /usr/local/runscripts

EXPOSE 22 80 9001
CMD ["/usr/bin/supervisord"]
