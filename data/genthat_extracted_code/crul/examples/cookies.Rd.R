library(crul)


### Name: cookies
### Title: Working with cookies
### Aliases: cookies

### ** Examples

## Not run: 
##D x <- HttpClient$new(
##D   url = "https://httpbin.org",
##D   opts = list(
##D     cookie = "c=1;f=5",
##D     verbose = TRUE
##D   )
##D )
##D x
##D 
##D # set cookies
##D (res <- x$get("cookies"))
##D jsonlite::fromJSON(res$parse("UTF-8"))
##D 
##D (x <- HttpClient$new(url = "https://httpbin.org"))
##D res <- x$get("cookies/set", query = list(foo = 123, bar = "ftw"))
##D jsonlite::fromJSON(res$parse("UTF-8"))
##D curl::handle_cookies(handle = res$handle)
##D 
##D # reuse handle
##D res2 <- x$get("get", query = list(hello = "world"))
##D jsonlite::fromJSON(res2$parse("UTF-8"))
##D curl::handle_cookies(handle = res2$handle)
##D 
##D # DOAJ
##D x <- HttpClient$new(url = "https://doaj.org")
##D res <- x$get("api/v1/journals/f3f2e7f23d444370ae5f5199f85bc100",
##D   verbose = TRUE)
##D res$response_headers$`set-cookie`
##D curl::handle_cookies(handle = res$handle)
##D res2 <- x$get("api/v1/journals/9abfb36b06404e8a8566e1a44180bbdc",
##D   verbose = TRUE)
##D 
##D ## reset handle
##D x$handle_pop()
##D ## cookies no longer sent, as handle reset
##D res2 <- x$get("api/v1/journals/9abfb36b06404e8a8566e1a44180bbdc",
##D   verbose = TRUE)
## End(Not run)



