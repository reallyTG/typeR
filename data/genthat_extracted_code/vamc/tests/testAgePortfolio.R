context("aging of one portfolio of guaratee contracts")
library(vamc)

histFundScen <- genFundScen(fundMap, histIdxScen)

test_that("test for correctness of aging a portfolio of guarantee contracts", {
  skip_on_cran()
  tmp <- tempfile()
  expect_equal_to_reference(agePortfolio(VAPort, mortTable, histFundScen,
                                         histDates, dT = 1 / 12, "2014-01-01",
                                         cForwardCurve), tmp)
})
