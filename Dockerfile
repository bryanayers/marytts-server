FROM adoptopenjdk:8u232-b09-jre-hotspot-bionic

ENV MARYTTS_VER 5.2

RUN \
	apt -y update && apt -y upgrade && \
	apt -y install \
		unzip \
		wget

WORKDIR /opt/marytts

RUN wget https://github.com/marytts/marytts/releases/download/v${MARYTTS_VER}/marytts-${MARYTTS_VER}.zip && \
	unzip marytts-${MARYTTS_VER}.zip

CMD ["/bin/bash", "-c", "/opt/marytts/marytts-${MARYTTS_VER}/bin/marytts-server"]
EXPOSE 59125
