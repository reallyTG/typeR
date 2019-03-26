Sys.setenv("R_TESTS" = "")

library("testthat")
library("ODEsensitivity")

test_check("ODEsensitivity")
