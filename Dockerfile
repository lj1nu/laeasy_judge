FROM ubuntu:16.04

ENV WDIR /lazy_judge
ENV RDIR /lazy_judge
COPY lazy_judge $WDIR/

RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/kr.archive.ubuntu.com/g" /etc/apt/sources.list

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y python2.7 python-pip
RUN pip install flask
RUN echo "flag is wmkr{flag in real server, check wargame.kr prob page}" > /flag
RUN chmod 400 /flag

RUN chmod 1733 /tmp /var/tmp /dev/shm
RUN chmod 1733 /proc
RUN chmod 600 $WDIR
RUN chmod +x $WDIR/start.sh

CMD ["/lazy_judge/start.sh"]

EXPOSE 2222