FROM centos:7

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*


# 1. Installing Kerberos server, admin and client
RUN yum install -y krb5-server krb5-libs krb5-auth-dialog
RUN yum install -y krb5-workstation krb5-libs

EXPOSE 88 749

ADD ./config.sh /config.sh

ENTRYPOINT ["/config.sh"]
