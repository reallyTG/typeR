library(testthat)
library(RSauceLabs)

if(Sys.getenv("NOT_CRAN") == "true"){
  test_check("RSauceLabs")
}
