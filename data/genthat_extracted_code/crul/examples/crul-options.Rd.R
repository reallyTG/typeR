library(crul)


### Name: crul-options
### Title: Set curl options, proxy, and basic auth
### Aliases: crul-options set_opts set_proxy set_auth set_headers
###   crul_settings

### ** Examples

# get settings
crul_settings()

# curl options
set_opts(timeout_ms = 1000)
crul_settings()
set_opts(timeout_ms = 4000)
crul_settings()
set_opts(verbose = TRUE)
crul_settings()
## Not run: 
##D HttpClient$new('https://httpbin.org')$get('get')
## End(Not run)

# basic authentication
set_auth(auth(user = "foo", pwd = "bar", auth = "basic"))
crul_settings()

# proxies
set_proxy(proxy("http://97.77.104.22:3128"))
crul_settings()

# headers
crul_settings(TRUE) # reset first
set_headers(foo = "bar")
crul_settings()
set_headers(`User-Agent` = "hello world")
crul_settings()
## Not run: 
##D set_opts(verbose = TRUE)
##D HttpClient$new('https://httpbin.org')$get('get')
## End(Not run)

# reset
crul_settings(TRUE)
crul_settings()

# works with async functions
## Async
set_opts(verbose = TRUE)
cc <- Async$new(urls = c(
    'https://httpbin.org/get?a=5',
    'https://httpbin.org/get?foo=bar'))
(res <- cc$get())

## AsyncVaried
set_opts(verbose = TRUE)
set_headers(stuff = "things")
reqlist <- list(
  HttpRequest$new(url = "https://httpbin.org/get")$get(),
  HttpRequest$new(url = "https://httpbin.org/post")$post())
out <- AsyncVaried$new(.list = reqlist)
out$request()



