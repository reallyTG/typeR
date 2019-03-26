context("cgi")

test_that("cgiRequest() returns the correct object", {
  # setup
  testParams <- "foo=1%2B1%3D2&bar=yin%26yang"
  requestObj <- list(
    params = list(foo = "1+1=2",
                  bar="yin&yang"),
    headers = list(),
    method = "GET",
    raw = NULL,
    content_type = NULL,
    protocol = "http",
    body = NULL
  )
  
  expect_equal(cgiRequest(testParams),
               requestObj)
})

