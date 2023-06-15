# Use the official Ubuntu base image

FROM ubuntu


# Install necessary packages

RUN apt-get update && apt-get install -y default-jdk wget



# Download and extract Apache Tomcat

RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.50/bin/apache-tomcat-9.0.50.tar.gz

RUN tar -xzvf apache-tomcat-9.0.50.tar.gz -C /opt


# Set environment variables

ENV CATALINA_HOME /opt/apache-tomcat-9.0.50

ENV PATH $CATALINA_HOME/bin:$PATH


COPY tomcat-users.xml /opt/apache-tomcat-9.0.76/conf/
COPY context.xml /opt/apache-tomcat-9.0.76/webapps/host-manager/META-INF/
COPY context.xml /opt/apache-tomcat-9.0.76/webapps/manager/META-INF/
# Expose the default Tomcat port

EXPOSE 8080


# Start Tomcat when the container launches

CMD ["catalina.sh", "run"]
