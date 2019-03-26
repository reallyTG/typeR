# setting R_TESTS to empty string because of
# https://github.com/hadley/testthat/issues/144
# https://github.com/hadley/testthat/issues/86
# revert this when that issue in R is fixed.
Sys.setenv("R_TESTS" = "")

library(testthat)
library(rsed)

test_check("rsed")
