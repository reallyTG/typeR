library(crul)


### Name: HttpClient
### Title: HTTP client
### Aliases: HttpClient
### Keywords: datasets

### ** Examples

## Not run: 
##D # set your own handle 
##D (h <- handle("https://httpbin.org"))
##D (x <- HttpClient$new(handle = h))
##D x$handle
##D x$url
##D (out <- x$get("get"))
##D x$handle
##D x$url
##D class(out)
##D out$handle
##D out$request_headers
##D out$response_headers
##D out$response_headers_all
##D 
##D # if you just pass a url, we create a handle for you
##D #  this is how most people will use HttpClient
##D (x <- HttpClient$new(url = "https://httpbin.org"))
##D x$url
##D x$handle # is empty, it gets created when a HTTP verb is called
##D (r1 <- x$get('get'))
##D x$url
##D x$handle 
##D r1$url
##D r1$handle
##D r1$content
##D r1$response_headers
##D r1$parse()
##D 
##D (res_get2 <- x$get('get', query = list(hello = "world")))
##D res_get2$parse()
##D library("jsonlite")
##D jsonlite::fromJSON(res_get2$parse())
##D 
##D # post request
##D (res_post <- x$post('post', body = list(hello = "world")))
##D 
##D ## empty body request
##D x$post('post')
##D 
##D # put request
##D (res_put <- x$put('put'))
##D 
##D # delete request
##D (res_delete <- x$delete('delete'))
##D 
##D # patch request
##D (res_patch <- x$patch('patch'))
##D 
##D # head request
##D (res_head <- x$head())
##D 
##D # arbitrary verb
##D (x <- HttpClient$new(url = "https://httpbin.org"))
##D x$verb('get')
##D x$verb('GET')
##D x$verb('GET', query = list(foo = "bar"))
##D x$verb('retry', 'GET', path = "status/400")
##D 
##D # retry, by default at most 3 times
##D (res_get <- x$retry("GET", path = "status/400"))
##D 
##D # retry, but not for 404 NOT FOUND
##D (res_get <- x$retry("GET", path = "status/404", terminate_on = c(404)))
##D 
##D # retry, but only for exceeding rate limit (note that e.g. Github uses 403)
##D (res_get <- x$retry("GET", path = "status/429", retry_only_on = c(403, 429)))
##D 
##D # query params are URL encoded for you, so DO NOT do it yourself
##D ## if you url encode yourself, it gets double encoded, and that's bad
##D (x <- HttpClient$new(url = "https://httpbin.org"))
##D res <- x$get("get", query = list(a = 'hello world'))
##D 
##D # get full url before the request is made
##D (x <- HttpClient$new(url = "https://httpbin.org"))
##D x$url_fetch()
##D x$url_fetch('get')
##D x$url_fetch('post')
##D x$url_fetch('get', query = list(foo = "bar"))
##D 
##D # access intermediate headers in response_headers_all
##D x <- HttpClient$new("https://doi.org/10.1007/978-3-642-40455-9_52-1")
##D bb <- x$get()
##D bb$response_headers_all
## End(Not run)



