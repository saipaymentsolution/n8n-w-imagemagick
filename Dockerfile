FROM alpine:3.20 AS alpine

FROM n8nio/n8n:latest

USER root

COPY --from=alpine /sbin/apk /sbin/apk
COPY --from=alpine /lib/ld-musl-*.so.1 /lib/
COPY --from=alpine /usr/lib/libapk.so.* /usr/lib/
COPY --from=alpine /etc/apk /etc/apk
COPY --from=alpine /lib/apk /lib/apk
COPY --from=alpine /usr/share/apk /usr/share/apk

RUN apk add --no-cache imagemagick

USER node
