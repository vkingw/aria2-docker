FROM alpine
MAINTAINER vincent <alfa.king+git@gmail.com>
RUN apk update && \
	apk add --no-cache --update bash && \
	mkdir -p /conf && \
	mkdir -p /data && \
	mkdir -p /start-script && \
	mkdir -p /root/.cache/aria2 && \
	apk add --no-cache --update aria2
ADD files/start.sh /start-script/start.sh
RUN chmod +x /start-script/start.sh
WORKDIR /
VOLUME ["/data"]
VOLUME ["/conf"]
VOLUME ["/root/.cache/aria2"]
EXPOSE 6800
CMD ["/start-script/start.sh"]