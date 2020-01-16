FROM alpine:3.11

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/

RUN wget -O /usr/local/bin/tfsec -q "$(wget -O - -q https://api.github.com/repos/liamg/tfsec/releases/latest | grep -o -E "https://.+?-linux-amd64")" \
    && chmod +x /usr/local/bin/tfsec

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
