library(httr)


### Name: parse_url
### Title: Parse and build urls according to RFC1808.
### Aliases: parse_url build_url

### ** Examples

parse_url("http://google.com/")
parse_url("http://google.com:80/")
parse_url("http://google.com:80/?a=1&b=2")

url <- parse_url("http://google.com/")
url$scheme <- "https"
url$query <- list(q = "hello")
build_url(url)



