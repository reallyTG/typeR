context("Test .calc_DoseRate()")

test_that("Full function test", {
  testthat::skip_on_cran()

  ##load Example dataset
  data("Example_Data", envir = environment())

  ##simple run to check the 'ref' fall back
  expect_type(RCarb:::.calc_DoseRate(x = 10, data = Example_Data[14,], ref = NULL), type = "list")

})