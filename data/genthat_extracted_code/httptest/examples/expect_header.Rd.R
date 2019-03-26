library(httptest)


### Name: expect_header
### Title: Test that an HTTP request is made with a header
### Aliases: expect_header

### ** Examples

library(httr)
with_fake_http({
    expect_header(GET("http://example.com", config=add_headers(Accept="image/png")),
        "Accept: image/png")
})



