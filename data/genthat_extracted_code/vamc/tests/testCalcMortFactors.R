context("calculation of pq and p from mortality table")
library(vamc)

histFundScen <- genFundScen(fundMap, histIdxScen)

test_that("test for correctness of pq and p", {
  tmp <- tempfile()
  testPolicy <- VAPort[1, ]
  expect_equal_to_reference(calcMortFactors(testPolicy, mortTable, dT = 1 / 12),
                            tmp)
})

test_that("test for error message when current date is prior to birth date", {
  testPolicy <- VAPort[1, ]
  testPolicy[1, "currentDate"] <- "1960-01-01"
  expect_error(calcMortFactors(testPolicy, mortTable, dT = 1 / 12),
               "Current date is prior to birth date.")
})

test_that("test for error message when current date is prior to birth date", {
  testPolicy <- VAPort[1, ]
  testPolicy[1, "matDate"] <- "1960-01-01"
  expect_error(calcMortFactors(testPolicy, mortTable, dT = 1 / 12),
               "Maturity date is prior to birth date.")
})

test_that("test for error message when current date is prior to birth date", {
  testPolicy <- VAPort[1, ]
  testPolicy[1, "matDate"] <- "1999-01-01"
  expect_error(calcMortFactors(testPolicy, mortTable, dT = 1 / 12),
               "Maturity date is prior to current date.")
})
