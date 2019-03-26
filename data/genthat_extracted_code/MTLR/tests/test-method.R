testthat::context("Testing methods for mtlr objects.")


#Here we will write very basic tests for print and plot since these
#objects are hard to write tests for. Additionally, predict is subtly
#checked in other functions by requiring the output to be consistent.
#however we add a few more tests.

# mtlr ------------------------------------------------------------
testthat::test_that("print and plot functions are consistent for basic survival dataset",{
  formula <- survival::Surv(time,status)~.
  data <- survival::lung
  mod <- mtlr(formula, data)
  expect_equal_to_reference(print(mod),"print.rds")
  expect_equal_to_reference(plot(mod),"plot.rds" )

  data <- survival::leukemia
  mod <- mtlr(formula, data)
  expect_warning(plot(mod))
})


testthat::test_that("predict function works across the different types",{
  formula <- survival::Surv(time,status)~.
  data <- survival::lung
  mod <- mtlr(formula, data)
  expect_equal_to_reference(predict(mod,data, type = "prob_event"),"predProb.rds")
  expect_equal_to_reference(predict(mod,data, type = "mean_time"),"predMean.rds" )
  expect_equal_to_reference(predict(mod,data, type = "median_time"),"predMedian.rds" )

  expect_error(predict(mod,survival::leukemia))

  expect_equal_to_reference(predict(mod,data,type = "survivalcurve", add_zero = F),"curve_NoZero.rds")
  expect_equal_to_reference(predict(mod,data,type = "prob_event", add_zero = F),"predProb_NoZero.rds")
  expect_equal_to_reference(predict(mod,data,type = "mean_time", add_zero = F),"predMean_NoZero.rds")
  expect_equal_to_reference(predict(mod,data, type = "median_time", add_zero = F),"predMedian_NoZero.rds")

})









