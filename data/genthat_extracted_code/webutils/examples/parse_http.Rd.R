library(webutils)


### Name: parse_http
### Title: Parse http request
### Aliases: parse_http

### ** Examples

# Parse json encoded payload:
parse_http('{"foo":123, "bar":true}', 'application/json')

# Parse url-encoded payload
parse_http("foo=1%2B1%3D2&bar=yin%26yang", "application/x-www-form-urlencoded")

## Not run: 
##D use demo app to parse multipart/form-data payload
##D demo_rhttpd()
## End(Not run)



