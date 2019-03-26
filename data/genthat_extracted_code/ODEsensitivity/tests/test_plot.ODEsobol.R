context("Test of plot.ODEsobol()")

test_that("Errors are thrown", {
  # An arbitrary Morris-result:
  arbit_res_morris <- diag(7)
  class(arbit_res_morris) <- "ODEmorris"
  
  expect_error(plot.sobolRes(1:3))
  expect_error(plot.sobolRes("No character!"))
  expect_error(plot.sobolRes(diag(7)))
  expect_error(plot.sobolRes(arbit_res_morris))
})
