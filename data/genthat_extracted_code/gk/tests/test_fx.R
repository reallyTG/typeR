library(gk)
context("Test exchange rate example")

test_that("Test exchange rate example", {
  skip_on_cran()
  expect_null(fx("quick"))
})
