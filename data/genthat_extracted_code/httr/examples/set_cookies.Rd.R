library(httr)


### Name: set_cookies
### Title: Set cookies.
### Aliases: set_cookies

### ** Examples

set_cookies(a = 1, b = 2)
set_cookies(.cookies = c(a = "1", b = "2"))

GET("http://httpbin.org/cookies")
GET("http://httpbin.org/cookies", set_cookies(a = 1, b = 2))



