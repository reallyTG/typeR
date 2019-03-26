library(httr)


### Name: http_error
### Title: Check for an http error.
### Aliases: http_error url_success url_ok

### ** Examples

# You can pass a url:
http_error("http://www.google.com")
http_error("http://httpbin.org/status/404")

# Or a request
r <- GET("http://httpbin.org/status/201")
http_error(r)

# Or an (integer) status code
http_error(200L)
http_error(404L)



