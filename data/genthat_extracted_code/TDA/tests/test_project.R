testthat::context("lints")

testthat::skip_if(
  Sys.getenv("TDA_TEST_LINT") != "true" || Sys.getenv("TRAVIS") == "true",
  message = paste(
    "Lint test disabled. To run tests, \n",
    "set env variable \"TDA_TEST_LINT\" to \"true\" or \n",
    "run `Sys.setenv(\"TDA_TEST_LINT\" = \"true\")` from within R"
  )
)

testthat::test_that("Package Style", {
  lintr::expect_lint_free()
})
