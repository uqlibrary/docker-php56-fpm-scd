FROM uqlibrary/centos:3

ENV COMPOSER_VERSION=1.6.5

RUN \
  yum install -y yum install -y http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm && \
  yum install -y \
    make \
    mysql-community-client \
    php56u-common \
    php56u-gd \
    php56u-imap \
    php56u-ldap \
    php56u-mcrypt \
    php56u-mysqlnd \
    php56u-pdo \
    php56u-pecl-geoip \
    php56u-pecl-memcached \
    php56u-pecl-redis \
    php56u-pecl-xdebug \
    php56u-pecl-zendopcache \
    php56u-pear-Net-Curl \
    php56u-pgsql \
    php56u-sqlite \
    php56u-soap \
    php56u-xmlrpc \
    php56u-mbstring \
    php56u-tidy \
    php56u-zipstream \
    php56u-devel \
    nfs-utils \
    gcc \
    git && \
  yum clean all && \
  sed -i "s/;date.timezone =.*/date.timezone = Australia\/Brisbane/" /etc/php.ini && \
  sed -i "s/memory_limit = 128M/memory_limit = -1/" /etc/php.ini && \
  sed -i "s/;opcache.enable_cli=0/opcache.enable_cli=1/" /etc/php.d/10-opcache.ini && \
  usermod -u 1000 nobody && \
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION}

COPY etc/php.d/15-xdebug.ini /etc/php.d/15-xdebug.ini