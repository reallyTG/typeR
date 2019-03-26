#################################################################################################
context("identify lags")
#################################################################################################
test_that("identify_lags outputs a data table", {
  micropem_na <- convert_output(system.file("extdata", "file_with_na.csv",
                                            package = "rtimicropem"))
  results <- identify_lags(micropem_na)
  expect_that(results, is_a("tbl_df"))
})
