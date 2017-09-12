FROM debian:stretch
MAINTAINER Joeri Verdeyen <joeriv@yappa.be>

RUN apt-get update && \
    apt-get install -y build-essential golang git && \
    mkdir -p /release

ENV NGROK_VERSION master
RUN git clone https://github.com/inconshreveable/ngrok.git /ngrok
RUN cd /ngrok; git checkout -fq $NGROK_VERSION

ADD *.sh /

ENV TLS_KEY **None**
ENV TLS_CERT **None**
ENV CA_CERT **None**
ENV DOMAIN **None**
ENV TUNNEL_ADDR :4443
ENV HTTP_ADDR :80
ENV HTTPS_ADDR :443

VOLUME ["/ngrok/bin"]

CMD ["/run-server.sh"]
