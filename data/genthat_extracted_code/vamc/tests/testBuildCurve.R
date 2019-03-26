context("forward curve built from discount factors")
library(vamc)

rate <- c(0.69, 0.77, 0.88, 1.01, 1.14, 1.38, 1.66, 2.15) * 0.01
tenor <- c(1, 2, 3, 4, 5, 7, 10, 30)
fixFreq <- 6
fixDCC <- "Thirty360"
fltFreq <- 6
fltDCC <- "ACT360"
calendar <- "NY"
bdc <- "Modified_Foll"
curveDate <- "2016-02-08"
numSetDay <- 2
yieldCurveDCC <- "Thirty360"

test_that("Test the correctness of the forward rate", {
  expect_equal(buildCurve(rate, tenor, fixFreq, fixDCC, fltFreq, fltDCC,
                          calendar, bdc, curveDate, numSetDay,
                          yieldCurveDCC)$forwardCurve,
               c(0.006912035, 0.008520036, 0.011060713, 0.014146403,
                 0.016846310, 0.020451281, 0.024514485, 0.032098279,
                 0.032098279),
               tolerance = 1e-7)
})

test_that("Test the error message when business day count is invalid", {
  bdc <- "Invalid type"
  expect_error(buildCurve(rate, tenor, fixFreq, fixDCC, fltFreq, fltDCC,
                          calendar, bdc, curveDate, numSetDay,
                          yieldCurveDCC)$forwardCurve,
               "Day count convention should be one of Following,
                          Preceding, Modified_Prec, or Modified_Foll.
                          Given Invalid type.")
})

test_that("Test the error message when floating/fixed day count is invalid", {
  fixDCC <- "Invalid"
  expect_error(buildCurve(rate, tenor, fixFreq, fixDCC, fltFreq, fltDCC,
                          calendar, bdc, curveDate, numSetDay,
                          yieldCurveDCC)$forwardCurve,
  "dcc should be one of Thirty360, ACT360, ACT365, or ACTACT. Given Invalid.")
  fixDCC <- "Thirty360"
  fltDCC <- "Invalid"
  expect_error(buildCurve(rate, tenor, fixFreq, fixDCC, fltFreq, fltDCC,
                          calendar, bdc, curveDate, numSetDay,
                          yieldCurveDCC)$forwardCurve,
  "dcc should be one of Thirty360, ACT360, ACT365, or ACTACT. Given Invalid.")
})

test_that("Test the error message when calendar is invalid", {
  calendar <- "Invalid"
  expect_error(buildCurve(rate, tenor, fixFreq, fixDCC, fltFreq, fltDCC,
                          calendar, bdc, curveDate, numSetDay,
                          yieldCurveDCC)$forwardCurve,
               "calendar should be one of General or NY. Given Invalid.")
})

test_that("Test the error message when number of discount factors differs from
          the observation periods", {
  rate <- c(0.69, 0.77) * 0.01
  tenor <- c(1, 2, 3)
  expect_error(buildCurve(rate, tenor, fixFreq, fixDCC, fltFreq, fltDCC,
                          calendar, bdc, curveDate, numSetDay,
                          yieldCurveDCC)$forwardCurve,
               "Number of discount factors is different from the number of
           observation dates")
})
