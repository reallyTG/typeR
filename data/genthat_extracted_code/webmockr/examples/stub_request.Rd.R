library(webmockr)


### Name: stub_request
### Title: Stub an http request
### Aliases: stub_request

### ** Examples

## Not run: 
##D # basic stubbing
##D stub_request("get", "https://httpbin.org/get")
##D stub_request("post", "https://httpbin.org/post")
##D 
##D # any method, use "any"
##D stub_request("any", "https://httpbin.org/get")
##D 
##D # list stubs
##D stub_registry()
##D 
##D # request headers
##D stub_request("get", "https://httpbin.org/get") %>%
##D    wi_th(headers = list('User-Agent' = 'R'))
##D 
##D # request body
##D stub_request("post", "https://httpbin.org/post") %>%
##D    wi_th(body = list(foo = 'bar'))
##D stub_registry()
##D library(crul)
##D x <- crul::HttpClient$new(url = "https://httpbin.org")
##D crul::mock()
##D x$post('post', body = list(foo = 'bar'))
##D 
##D # add expectation with to_return
##D stub_request("get", "https://httpbin.org/get") %>%
##D   wi_th(
##D     query = list(hello = "world"),
##D     headers = list('User-Agent' = 'R')) %>%
##D   to_return(status = 200, body = "stuff", headers = list(a = 5))
##D 
##D # list stubs again
##D stub_registry()
##D 
##D # regex
##D stub_request("get", uri_regex = ".+ample\\..")
##D 
##D # set stub an expectation to timeout
##D stub_request("get", "https://httpbin.org/get") %>% to_timeout()
##D x <- crul::HttpClient$new(url = "https://httpbin.org")
##D res <- x$get('get')
##D 
##D # raise exception
##D library(fauxpas)
##D stub_request("get", "https://httpbin.org/get") %>% to_raise(HTTPAccepted)
##D stub_request("get", "https://httpbin.org/get") %>% to_raise(HTTPAccepted, HTTPGone)
##D 
##D x <- crul::HttpClient$new(url = "https://httpbin.org")
##D stub_request("get", "https://httpbin.org/get") %>% to_raise(HTTPBadGateway)
##D crul::mock()
##D x$get('get')
##D 
##D # pass options to .list to avoid NSE
##D z <- stub_request("get", "https://httpbin.org/get")
##D wi_th(z, .list = list(query = list(foo = "bar")))
##D 
##D # clear all stubs
##D stub_registry()
##D stub_registry_clear()
## End(Not run)



