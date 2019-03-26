### to also run skip_on_cran() tests, uncomment:
Sys.setenv(NOT_CRAN="true")

library(testthat)
library(getmstatistic)

test_check("getmstatistic")
