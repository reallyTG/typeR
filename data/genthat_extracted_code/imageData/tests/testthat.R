Sys.setenv("R_TESTS" = "")
library(testthat)
#Need to execute the following for manual checking
#Sys.setenv(NOT_CRAN = "true")
test_check("imageData")
