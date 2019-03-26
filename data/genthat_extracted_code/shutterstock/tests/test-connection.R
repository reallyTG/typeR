context("test-connection")

### httptest tests ------------------------------------------------

# httptest::start_capturing()

with_mock_api({
  test_that("check http type", {
    response <- httr::GET("https://api.shutterstock.com/v2/test")
    expect_silent(check_http_type(response, type = "application/json"))
    expect_error(check_http_type(response, type = "text/html"))
  })
})

with_mock_api({
  test_that("stop error status", {
    clear_response <- httr::GET("https://api.shutterstock.com/v2/test")
    expect_silent(stop_error_status(clear_response))

    response_400 <- httr::GET("https://api.shutterstock.com/v2/2bad%request400")
    expect_error(stop_error_status(response_400))

    response_401 <- httr::GET("https://api.shutterstock.com/v2/images/recommendations")
    expect_error(stop_error_status(response_401))

    response_404 <- httr::GET("https://api.shutterstock.com/v2/testcake")
    expect_error(stop_error_status(response_404))

  })
})

# httptest::stop_capturing()

### httptest tests ------------------------------------------------

test_that("can get a response", {
  # expect an internal error for non implemented methods e.g. PATCH
  expect_error(get_response("PATCH", "test"))
})

test_that("sstk oauth scope validation", {
  # return a single scope:
  expect_equal(
    sstk_oauth_scope("collections.edit"),
    "collections.edit"
  )

  # return multiple scopes:
  expect_equal(
    sstk_oauth_scope(c("collections.edit", "collections.view")),
    c("collections.edit", "collections.view")
  )

  # return all scopes:
  expect_equal(
    sstk_oauth_scope("all"),
    c(
      "collections.edit",
      "collections.view",
      "earnings.view",
      "licenses.create",
      "licenses.view",
      "media.edit",
      "media.submit",
      "media.upload",
      "organization.address",
      "organization.view",
      "purchases.view",
      "reseller.purchase",
      "reseller.view",
      "user.address",
      "user.edit",
      "user.email",
      "user.view"
    )
  )

  expect_error(sstk_oauth_scope(c("collections.edit", "XYZ-NONEXISTS")))
})

test_that("sstk oauth endpoint", {
  endpoints <- sstk_oauth_endpoint()
  expect_equal(endpoints[["authorize"]],
               "https://api.shutterstock.com/v2/oauth/authorize")
  expect_equal(endpoints[["access"]],
               "https://api.shutterstock.com/v2/oauth/access_token")
  expect_is(endpoints, "oauth_endpoint")
})
