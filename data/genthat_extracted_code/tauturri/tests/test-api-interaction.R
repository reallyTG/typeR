context("test-api-interaction.R")

test_that("API-requests work", {
  res <- api_request()
  expect_is(res$result, "character")
  expect_equal(res$result, "success")
  expect_is(res$data, "list")

  expect_error(api_request(url = "google.com"))
  expect_error(api_request(url = "", apikey = ""))
  expect_error(api_request(url = "http://example.com/hello"))

  res <- api_request(cmd = "poopybutthole")
  expect_equal(res$result, "success")
  expect_identical(unname(res$data), list())
})

test_that("Arnold... works?", {
  res <- arnold()
  expect_is(res, "character")
  expect_length(res, 1)
})
