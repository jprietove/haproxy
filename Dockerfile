# HAProxy with keepalived

FROM haproxy:latest
MAINTAINER Javier Prieto <javier.prieto.edu@juntadeandalucia.es>

LABEL Title="HAProxy Keepalived" \
      Description="HAProxy with keepalived"

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

USER root

RUN apt update && apt install -y keepalived

VOLUME [ "/usr/local/etc/haproxy" ]
VOLUME [ "/etc/keepalived" ]

ENTRYPOINT /usr/sbin/keepalived -f /etc/keepalived/keepalived.conf && bash
