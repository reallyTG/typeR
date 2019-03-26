library(httptest)


### Name: with_fake_http
### Title: Make all HTTP requests return a fake response
### Aliases: with_fake_http with_fake_HTTP

### ** Examples

with_fake_http({
    expect_GET(req1 <- httr::GET("http://example.com"), "http://example.com")
    req1$url
    expect_POST(req2 <- httr::POST("http://example.com", body='{"a":1}'),
        "http://example.com")
    httr::content(req2)
})



