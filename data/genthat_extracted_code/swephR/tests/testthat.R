## inhibit overloading of ephemeris provided by
## swephR and swephRdata
Sys.setenv(SE_EPHE_PATH = "")

library(testthat)
library(swephR)

test_check("swephR")
