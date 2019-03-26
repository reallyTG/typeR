
# test_that code to check on error message when rjags is not installed

# You need to run this BEFORE any other functions that call rjags.

# library(testthat)
require(wiqid)

context("Error message when rjags not installed")

oldLibs <- .libPaths()
.libPaths(.Library)

test_that("Error message without rjags",  {
  # Generate data
  x <- rnorm(10, 1, 0.15)
  expect_error(Bnormal2(x), "'rjags' package and the JAGS program are needed")
})

.libPaths(oldLibs)
