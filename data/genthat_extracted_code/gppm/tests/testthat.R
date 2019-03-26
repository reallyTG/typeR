Sys.setenv("R_TESTS" = "")
library(testthat)
library(gppm)

test_check("gppm")
