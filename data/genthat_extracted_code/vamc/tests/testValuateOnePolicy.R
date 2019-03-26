context("valuation of one guaratee contract")
library(vamc)

fundScen <- genFundScen(fundMap, indexScen)[1:2, , ]
test_that("test for the correctness of valuation", {
  testPolicy <- VAPort[1, ]
  expect_equal(valuateOnePolicy(testPolicy, mortTable, fundScen,
                                1 / 12, cForwardCurve),
               list(policyValue = 0, riskCharge = 454.1419), tolerance = 1)
})
