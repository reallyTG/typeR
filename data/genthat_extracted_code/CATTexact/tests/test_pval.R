library(CATTexact)
context("P-values")


test_that("Comparing p-values with reference", {
  expect_equal(round(catt_exact(c(0,1,2), c(5,5,5), c(3,3,3))$exact.pvalue,3),0.622)
  expect_equal(round(catt_exact(c(0,1,2), c(5,5,5), c(3,3,3))$asymptotic.pvalue,3),0.5)
  expect_equal(round(catt_asy(c(0,1,2), c(5,5,5), c(3,3,3))$asymptotic.pvalue,3),0.5)
  expect_equal(round(catt_exact(c(0,10,35), c(48,50,52), c(3,13,16))$exact.pvalue,3),0.005)
  expect_equal(round(catt_exact(c(0,10,35), c(48,50,52), c(3,13,16))$asymptotic.pvalue,3),0.004)
  expect_equal(round(catt_asy(c(0,10,35), c(48,50,52), c(3,13,16))$asymptotic.pvalue,3),0.004)
})

test_that("Output is correct when dose responses are noninteger (known bug in earlier versions)", {
  expect_equal(round(catt_exact(c(0,85.5,285.2,1077.4), c(51,51,51,51), c(0,2,1,1))$exact.pvalue,3),0.418)
  expect_equal(round(catt_exact(c(0,85.5,285.2,1077.4), c(51,51,51,51), c(0,2,1,1))$asymptotic.pvalue,3),0.460)
  expect_equal(round(catt_asy(c(0,85.5,285.2,1077.4), c(51,51,51,51), c(0,2,1,1))$asymptotic.pvalue,3),0.460)
})
