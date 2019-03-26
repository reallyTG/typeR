library(crul)


### Name: Async
### Title: Simple async client
### Aliases: Async
### Keywords: datasets

### ** Examples

## Not run: 
##D cc <- Async$new(
##D   urls = c(
##D     'https://httpbin.org/',
##D     'https://httpbin.org/get?a=5',
##D     'https://httpbin.org/get?foo=bar'
##D   )
##D )
##D cc
##D (res <- cc$get())
##D res[[1]]
##D res[[1]]$url
##D res[[1]]$success()
##D res[[1]]$status_http()
##D res[[1]]$response_headers
##D res[[1]]$method
##D res[[1]]$content
##D res[[1]]$parse("UTF-8")
##D lapply(res, function(z) z$parse("UTF-8"))
##D 
##D # using auth with async
##D dd <- Async$new(urls = rep('https://httpbin.org/basic-auth/user/passwd', 3))
##D res <- dd$get(auth = auth(user = "user", pwd = "passwd"))
##D res
##D vapply(res, function(z) z$status_code, double(1))
##D vapply(res, function(z) z$success(), logical(1))
##D lapply(res, function(z) z$parse("UTF-8"))
##D 
##D # failure behavior
##D ## e.g. when a URL doesn't exist, a timeout, etc.
##D urls <- c("http://stuffthings.gvb", "https://foo.com", 
##D   "https://httpbin.org/get")
##D conn <- Async$new(urls = urls)
##D res <- conn$get()
##D res[[1]]$parse("UTF-8") # a failure
##D res[[2]]$parse("UTF-8") # a failure
##D res[[3]]$parse("UTF-8") # a success
##D 
##D # use arbitrary http verb
##D cc <- Async$new(
##D   urls = c(
##D     'https://httpbin.org/',
##D     'https://httpbin.org/get?a=5',
##D     'https://httpbin.org/get?foo=bar'
##D   )
##D )
##D method <- 'get'
##D (res <- cc$verb(method))
##D lapply(res, function(z) z$parse("UTF-8"))
## End(Not run)



