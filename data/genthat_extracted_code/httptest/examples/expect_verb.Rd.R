library(httptest)


### Name: expect_verb
### Title: Expectations for mocked HTTP requests
### Aliases: expect_verb expect_GET expect_POST expect_PUT expect_PATCH
###   expect_DELETE expect_no_request

### ** Examples

library(httr)
without_internet({
    expect_GET(GET("http://httpbin.org/get"),
        "http://httpbin.org/get")
    expect_GET(GET("http://httpbin.org/get"),
        "http://httpbin.org/[a-z]+",
        fixed=FALSE) # For regular expression matching
    expect_PUT(PUT("http://httpbin.org/put", body='{"a":1}'),
        'http://httpbin.org/put',
        '{"a":1}')
    expect_PUT(PUT("http://httpbin.org/put", body='{"a":1}'))
    expect_no_request(rnorm(5))
})



