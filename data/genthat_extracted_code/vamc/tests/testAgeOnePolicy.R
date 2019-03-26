context("aging of one guaratee contract")
library(vamc)

histFundScen <- genFundScen(fundMap, histIdxScen)

test_that("test for correctness of aging a guarantee contract", {
  testPolicy <- VAPort[1, ]
  expect_equal(ageOnePolicy(testPolicy, mortTable, histFundScen, histDates,
                            1 / 12, "2011-09-01",
                            cForwardCurve)[1, "currentDate"],
               as.Date("2011-09-01"))
  expect_equal(ageOnePolicy(testPolicy, mortTable, histFundScen, histDates,
                            1 / 12, "2011-09-01",
                            cForwardCurve)[1, "fundValue1"],
               81158.12, tolerance = 1)
  expect_equal(ageOnePolicy(testPolicy, mortTable, histFundScen, histDates,
                            1 / 12, "2011-09-01",
                            cForwardCurve)[1, "fundValue2"],
               85864.5, tolerance = 1)
  expect_equal(ageOnePolicy(testPolicy, mortTable, histFundScen, histDates,
                            1 / 12, "2011-09-01",
                            cForwardCurve)[1, "fundValue3"],
               84559.71, tolerance = 1)
  expect_equal(ageOnePolicy(testPolicy, mortTable, histFundScen, histDates,
                            1 / 12, "2011-09-01",
                            cForwardCurve)[1, "fundValue4"],
               56220.55, tolerance = 1)
  expect_equal(ageOnePolicy(testPolicy, mortTable, histFundScen, histDates,
                            1 / 12, "2011-09-01",
                            cForwardCurve)[1, "fundValue5"],
               53659.12, tolerance = 1)
  expect_equal(ageOnePolicy(testPolicy, mortTable, histFundScen, histDates,
                            1 / 12, "2011-09-01",
                            cForwardCurve)[1, "fundValue6"],
               83118.7, tolerance = 1)
  expect_equal(ageOnePolicy(testPolicy, mortTable, histFundScen, histDates,
                            1 / 12, "2011-09-01",
                            cForwardCurve)[1, "fundValue7"],
               0, tolerance = 1)
  expect_equal(ageOnePolicy(testPolicy, mortTable, histFundScen, histDates,
                            1 / 12, "2011-09-01",
                            cForwardCurve)[1, "fundValue8"],
               0, tolerance = 1)
  expect_equal(ageOnePolicy(testPolicy, mortTable, histFundScen, histDates,
                            1 / 12, "2011-09-01",
                            cForwardCurve)[1, "fundValue9"],
               85163.2, tolerance = 1)
  expect_equal(ageOnePolicy(testPolicy, mortTable, histFundScen, histDates,
                            1 / 12, "2011-09-01",
                            cForwardCurve)[1, "fundValue10"],
               71162.39, tolerance = 1)
})

test_that("test for warning message when target date is ahead of issueDate", {
  testPolicy <- VAPort[1, ]
  expect_warning(ageOnePolicy(testPolicy, mortTable, histFundScen, histDates,
                              1 / 12, "2010-09-01", forwardCurve),
                 "No aging required. Original policy returned.")
})

test_that("test for error message when val date is later than histDates", {
  testPolicy <- VAPort[1, ]
  expected <- "No aging performed. Target date beyond the last date of
historical scenario date 2016-02-01"
  expected <- gsub("[\r\n]", " ", expected)
  expect_error(ageOnePolicy(testPolicy, mortTable, histFundScen, histDates,
                            1 / 12, "2016-03-01", forwardCurve), expected)
})

test_that("test for error message when current date is ahead of histDates", {
  testPolicy <- VAPort[1, ]
  testPolicy[1, c("issueDate", "currentDate")] <- c("2001-01-01", "2001-01-01")
  expected <- "No aging performed. Current date before the first date of
historical scenario date 2001-08-01"
  expected <- gsub("[\r\n]", " ", expected)
  expect_error(ageOnePolicy(testPolicy, mortTable, histFundScen, histDates,
                            1 / 12, "2014-01-01", forwardCurve), expected)
})
