library(testthat)
library(sparkavro)

if(identical(Sys.getenv("NOT_CRAN"), "true")) { # testthat::skip_on_cran
  cat(sprintf("Starting tests\n"))
  test_check("sparkavro")
}else{
  cat("Skipping Tests\n")
}
