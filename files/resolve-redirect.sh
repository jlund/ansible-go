#!/bin/sh
PYTHON_VERSION=$1
URL=$2

# golang URLs are behind a redirect that requires clients
# that support TLS SNI which Python 2.7.6 found on
# most Ubuntu 14.04 installations does not support.
# get_url will fail if executed against the original URL
# but will succeed with the final URL

test "$PYTHON_VERSION" "<" "2.7.9" &&
url=$(curl -s -I "$URL" | sed -n "s/Location: //p") &&
test -n "$url" &&
URL="$url"; echo "$URL"
