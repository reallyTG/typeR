# workaround for error LC_CTYPE failed, using "C" but does not work
#https://github.com/r-lib/testthat/issues/86
#Sys.setenv("R_TESTS" = "")

library(testthat)
library(lognorm)

#test_package("gapfillResp")
test_check("lognorm")
