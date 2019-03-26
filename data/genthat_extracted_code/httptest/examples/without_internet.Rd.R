library(httptest)


### Name: without_internet
### Title: Make all HTTP requests raise an error
### Aliases: without_internet

### ** Examples

without_internet({
    expect_error(httr::GET("http://httpbin.org/get"),
        "GET http://httpbin.org/get")
    expect_error(httr::PUT("http://httpbin.org/put",
        body='{"a":1}'),
        'PUT http://httpbin.org/put {"a":1}', fixed=TRUE)
})



