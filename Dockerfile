FROM ubuntu:latest
MAINTAINER rahulgolash <rahul.golash@gmail.com>

RUN apt-get update
RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:ethereum/ethereum
RUN apt-get update
RUN apt-get install -y ethereum
RUN apt-get update
RUN apt-get install -y curl net-tools iputils-ping dnsutils

ENV RUN_BOOTNODE=false \
		BOOTNODE_URL=""

WORKDIR /opt

# bootnode port
EXPOSE 30301
EXPOSE 30301/udp

ADD bin/* /opt/
RUN chmod +x /opt/*.sh

ENTRYPOINT ["/opt/startgeth.sh"]
#CMD ["/usr/bin/geth"]
