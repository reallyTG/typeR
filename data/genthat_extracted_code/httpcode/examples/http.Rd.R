library(httpcode)


### Name: http
### Title: Find out about http status codes
### Aliases: http http_code http_search

### ** Examples

# search by code
http_code(100)
http_code(400)
http_code(503)
## verbose explanation
http_code(100, verbose = TRUE)
http_code(400, verbose = TRUE)
http_code(503, verbose = TRUE)

# fuzzy code search
http_code('1xx')
http_code('3xx')
http_code('30[12]')
http_code('30[34]')
http_code('30[34]')
## verbose explanation
http_code('1xx', verbose = TRUE)
http_code('3xx', verbose = TRUE)

# search by text message
http_search("request")
http_search("forbidden")
http_search("too")
## verbose explanation
http_search("request", verbose = TRUE)




