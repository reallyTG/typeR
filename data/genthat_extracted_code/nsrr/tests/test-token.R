testthat::context(desc = "Testing data sets")


testthat::test_that(
  "Testing if data sets returns a data.frame if not authenticated", {

    df = nsrr_datasets(NULL)
    testthat::expect_is(df, "data.frame")

  })

testthat::test_that("Testing if data sets returns a data.frame", {

  token = nsrr_token()
  if (!is.null(token)) {
    df = nsrr_datasets(token = token)
    testthat::expect_is(df, "data.frame")
  }

})
