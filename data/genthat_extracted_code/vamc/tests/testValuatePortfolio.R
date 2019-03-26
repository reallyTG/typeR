context("valuate of one portfolio of guaratee contracts")
library(vamc)

fundScen <- genFundScen(fundMap, indexScen)[1:5, , ]
test_that("test for the correctness of valuation", {
  skip_on_cran()
  tmp <- tempfile()
  expect_equal_to_reference(valuatePortfolio(VAPort, mortTable, fundScen,
                                             1 / 12, cForwardCurve), tmp)
})
