library(webmockr)


### Name: UriPattern
### Title: UriPattern
### Aliases: UriPattern
### Keywords: internal

### ** Examples

# trailing slash
(z <- UriPattern$new(pattern = "http://foobar.com"))
z$matches("http://foobar.com")
z$matches("http://foobar.com/")

# default ports
(z <- UriPattern$new(pattern = "http://foobar.com"))
z$matches("http://foobar.com:80")
z$matches("http://foobar.com:80/")
z$matches("http://foobar.com:443")
z$matches("http://foobar.com:443/")

# user info
(z <- UriPattern$new(pattern = "http://foobar.com"))
z$matches("http://user:pass@foobar.com")

# regex
(z <- UriPattern$new(regex_pattern = ".+ample\\.."))
z$matches("http://sample.org")
z$matches("http://example.com")
z$matches("http://tramples.net")

# add query parameters
(z <- UriPattern$new(pattern = "http://foobar.com"))
z$add_query_params(list(pizza = "cheese", cheese = "cheddar"))
z$pattern

(z <- UriPattern$new(pattern = "http://foobar.com"))
z$pattern
z$add_query_params(list(pizza = "deep dish", cheese = "cheddar"))
z$pattern



