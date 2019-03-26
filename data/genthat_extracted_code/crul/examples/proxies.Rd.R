library(crul)


### Name: proxies
### Title: proxy options
### Aliases: proxies proxy

### ** Examples

proxy("http://97.77.104.22:3128")
proxy("97.77.104.22:3128")
proxy("http://97.77.104.22:3128", "foo", "bar")
proxy("http://97.77.104.22:3128", "foo", "bar", auth = "digest")
proxy("http://97.77.104.22:3128", "foo", "bar", auth = "ntlm")

# socks
proxy("socks5://localhost:9050/", auth = NULL)

## Not run: 
##D # with proxy (look at request/outgoing headers)
##D # (res <- HttpClient$new(
##D #   url = "http://www.google.com",
##D #   proxies = proxy("http://97.77.104.22:3128")
##D # ))
##D # res$proxies
##D # res$get(verbose = TRUE)
##D 
##D # vs. without proxy (look at request/outgoing headers)
##D # (res2 <- HttpClient$new(url = "http://www.google.com"))
##D # res2$get(verbose = TRUE)
##D 
##D 
##D # Use authentication
##D # (res <- HttpClient$new(
##D #   url = "http://google.com",
##D #   proxies = proxy("http://97.77.104.22:3128", user = "foo", pwd = "bar")
##D # ))
##D 
##D # another example
##D # (res <- HttpClient$new(
##D #   url = "http://ip.tyk.nu/",
##D #   proxies = proxy("http://200.29.191.149:3128")
##D # ))
##D # res$get()$parse("UTF-8")
## End(Not run)



