context("rvnorm")

test_that("rvnorm returns an object of the correct class and attributes", {
  # install_github("cran/rv"); library(rv)
  x <- rvnorm(10)
  expect_s3_class(x, "rv")
  expect_s3_class(-x, "rv")
  expect_equal(length(x), 10)
  
  x <- rvnorm(mean = 1:5, sd = 1)
  expect_s3_class(x, "rv")
  expect_s3_class(-x, "rv")
})
