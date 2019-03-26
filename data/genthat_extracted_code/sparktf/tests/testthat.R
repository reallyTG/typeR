library(testthat)
library(sparktf)

if (identical(Sys.getenv("NOT_CRAN"), "true")) {
  test_check("sparktf")
  on.exit({spark_disconnect_all()})
}
