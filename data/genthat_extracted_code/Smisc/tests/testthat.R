# setting R_TESTS to empty string because of
# https://github.com/hadley/testthat/issues/144
# https://github.com/hadley/testthat/issues/86
# revert this when that issue in R is fixed.
Sys.setenv("R_TESTS" = "")

library(testthat)
library(Smisc)

# There shouldn't be any files in the tmp folder
unlink("testthat/tmp", recursive = TRUE, force = TRUE)
dir.create("testthat/tmp")

test_check("Smisc")
