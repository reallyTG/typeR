if(suppressPackageStartupMessages(requireNamespace("testthat"))) {
  library("sss")
  testthat::test_check("sss")
}
