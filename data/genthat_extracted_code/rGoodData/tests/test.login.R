library(httptest)
library(mockery)

context("Login")

test_that("Login procedure works", {
  with_mock_API({
    expect_POST(sst <- superSecuredToken())
    expect_GET(sst <- temporaryToken("dummy"))
  })
})


test_that("Login unauthorized message is correct", {
  with_mock(
    status_code = mock(401L, cycle = T),
    buildMockURL = mock("test.com/login-401.json", cycle = T),
    with_mock_API({
      expect_error(sst <- superSecuredToken(), regexp = "401")
    })
  )
})
