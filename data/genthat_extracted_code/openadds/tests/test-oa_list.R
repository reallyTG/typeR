context("oa_list")

test_that("oa_list works", {
  skip_on_cran()

  res <- oa_list()

  expect_is(res, "data.frame")
  expect_is(res$source[1], "character")
  expect_match(res$processed[1], "\\.zip")
})

test_that("oa_list fails well", {
  skip_on_cran()

  library("crul")
  expect_error(oa_list(timeout_ms = 1), "Timeout was reached")
})
