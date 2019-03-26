testthat::context("plotcurves is consistent with previous plots.")



# plotcurves ------------------------------------------------------------
testthat::test_that("plotcurves function is consistent",{
  formula <- survival::Surv(time,status)~.
  data <- survival::lung
  mod <- mtlr(formula,data)
  curves <- predict(mod)
  expect_warning(plotcurves(curves, index=  1:3, color = c("red","green")))

  expect_equal_to_reference(plotcurves(curves), "1curve.rds")
  expect_equal_to_reference(plotcurves(curves, color = "pink"), "1curve_colored.rds")
  expect_equal_to_reference(plotcurves(curves, index = 1:20), "manycurves.rds")
  expect_equal_to_reference(plotcurves(curves, xlim = c(0,20)), "curveshortx.rds")
})
