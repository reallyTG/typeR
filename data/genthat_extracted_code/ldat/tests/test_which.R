
context("which")

test_that("which works", {
  x <- c(TRUE, FALSE, NA, TRUE, TRUE, FALSE)
  expect_that(as_rvec(which(x)), equals(which(x)))
})

