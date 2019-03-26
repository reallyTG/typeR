library(crul)


### Name: curl-options
### Title: curl options
### Aliases: curl-options user-agent verbose timeout

### ** Examples

## Not run: 
##D url <- "https://httpbin.org"
##D 
##D # set curl options on client initialization
##D (res <- HttpClient$new(url = url, opts = list(verbose = TRUE)))
##D res$opts
##D res$get('get')
##D 
##D # or set curl options when performing HTTP operation
##D (res <- HttpClient$new(url = url))
##D res$get('get', verbose = TRUE)
##D res$get('get', stuff = "things")
##D 
##D # set a timeout
##D (res <- HttpClient$new(url = url, opts = list(timeout_ms = 1)))
##D # res$get('get')
##D 
##D # set user agent either as a header or an option
##D HttpClient$new(url = url,
##D   headers = list(`User-Agent` = "hello world"),
##D   opts = list(verbose = TRUE)
##D )$get('get')
##D 
##D HttpClient$new(url = url,
##D   opts = list(verbose = TRUE, useragent = "hello world")
##D )$get('get')
## End(Not run)



