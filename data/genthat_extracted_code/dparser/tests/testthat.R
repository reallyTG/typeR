Sys.setenv("R_TESTS" = "")
library(testthat)
library(dparser)

test_check("dparser")
