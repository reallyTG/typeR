library(spduration)
context("`plot` handling of input arguments")

test_that("plot_hazard accepts all input options", {
  
  data(model.coups)
  
  expect_output(print(plot_hazard(model.coups)), NULL)
  
  expect_output(print(plot_hazard(model.coups, t = c(1:20))), NULL)
  expect_error(plot_hazard(model.coups, t = c(-1:20)))
  
  expect_output(print(plot_hazard(model.coups, xvals = c(1, -5))), NULL)
  expect_error(plot_hazard(model.coups, xvals = c(1)))
  expect_error(plot_hazard(model.coups, xvals = c(1, -5, 1)))
  
  expect_output(print(plot_hazard(model.coups, zvals = c(1, -5))), NULL)
  expect_error(plot_hazard(model.coups, zvals = c(1)))
  expect_error(plot_hazard(model.coups, zvals = c(1, -5, 1)))
  
  # Passing options to plot
  expect_output(print(plot_hazard(model.coups, zvals = c(1, -5), ci=FALSE, col="blue")), NULL)
})