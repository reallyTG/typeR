context("get_data function tests")

test_that("get_data return errors", {

  expect_error(get_data(subdomain = "xxx", 1))
  expect_error(get_data(subdomain = "kyy"))
})
