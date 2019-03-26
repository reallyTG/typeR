context("Test of plot.ODEmorris()")

test_that("Errors are thrown", {
  # An arbitrary Sobol'-result:
  arbit_res_sobol <- diag(7)
  class(arbit_res_sobol) <- "ODEsobol"
  
  expect_error(plot.morrisRes(1:3))
  expect_error(plot.morrisRes("No character!"))
  expect_error(plot.morrisRes(diag(7)))
  expect_error(plot.morrisRes(arbit_res_sobol))
})
