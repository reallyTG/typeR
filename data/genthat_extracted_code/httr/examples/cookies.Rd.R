library(httr)


### Name: cookies
### Title: Access cookies in a response.
### Aliases: cookies

### ** Examples

r <- GET("http://httpbin.org/cookies/set", query = list(a = 1, b = 2))
cookies(r)



