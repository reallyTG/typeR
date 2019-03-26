library(httr)


### Name: has_content
### Title: Does the request have content associated with it?
### Aliases: has_content
### Keywords: internal

### ** Examples

has_content(POST("http://httpbin.org/post", body = FALSE))
has_content(HEAD("http://httpbin.org/headers"))



