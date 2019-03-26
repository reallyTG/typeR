library(httr)


### Name: add_headers
### Title: Add additional headers to a request.
### Aliases: add_headers

### ** Examples

add_headers(a = 1, b = 2)
add_headers(.headers = c(a = "1", b = "2"))

GET("http://httpbin.org/headers")

# Add arbitrary headers
GET(
  "http://httpbin.org/headers",
  add_headers(version = version$version.string)
)

# Override default headers with empty strings
GET("http://httpbin.org/headers", add_headers(Accept = ""))



