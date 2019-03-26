library(httr)


### Name: authenticate
### Title: Use http authentication.
### Aliases: authenticate

### ** Examples

GET("http://httpbin.org/basic-auth/user/passwd")
GET(
  "http://httpbin.org/basic-auth/user/passwd",
  authenticate("user", "passwd")
)



