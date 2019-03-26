library(testthat)
library(msde)

Sys.unsetenv("R_TESTS")
test_check("msde")
