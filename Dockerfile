FROM       ubuntu:14.04
MAINTAINER Nate Jones <nate@endot.org>

RUN apt-get update
RUN apt-get install software-properties-common language-pack-en -y
RUN add-apt-repository ppa:nesthib/weechat-stable -y

RUN apt-get update
RUN apt-get install weechat=1.0.1~stable+20140928~trusty1 bitlbee bitlbee-plugin-otr perl -y
RUN ln -sf /usr/share/zoneinfo/PST8PDT /etc/localtime

ADD bitlbee.conf /etc/bitlbee/bitlbee.conf

ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
