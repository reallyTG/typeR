library(crul)


### Name: ok
### Title: check if a url is okay
### Aliases: ok

### ** Examples

## Not run: 
##D # 200
##D ok("https://google.com") 
##D # 200
##D ok("https://httpbin.org/status/200")
##D # 404
##D ok("https://httpbin.org/status/404")
##D # doesn't exist
##D ok("https://stuff.bar")
##D # doesn't exist
##D ok("stuff")
##D 
##D # with HttpClient
##D z <- crul::HttpClient$new("https://httpbin.org/status/404", 
##D  opts = list(verbose = TRUE))
##D ok(z)
## End(Not run)



