# unit tests for S3 class participationRisk
context("participationRisk S3 class")

# checking constructor
test_that("participationRisk: checks at construction are ok", {

  # error when some parameters are missing
  expect_error(participationRisk())

  ## volatility checks
  expect_error(participationRisk(volatility = list()),
               "types")
  expect_error(participationRisk(volatility = "a"),
               "types")
  expect_error(participationRisk(volatility = c(1,2)),
               "dimensions")
  expect_error(participationRisk(volatility = c(NA)),
               "Invalid types")
  expect_error(participationRisk(volatility = c(Inf)),
               "Non-finite")

})

test_that("participationRisk: internal structure is ok", {

  # define a valid participationRisk
  a <- participationRisk(volatility = 3)

  # checking internal representation of attributes
  expect_equal(length(a), 1)
  expect_equal(names(a), c("volatility"))

  # checking class membership
  expect_equal(is.participationRisk(a), TRUE)
  expect_equal(is.risk(a), TRUE)

})



test_that("participationRisk: standard methods are ok", {

  # format
  expect_equal(class(format(participationRisk(volatility = 3))),
               "character")

  # summary
  expect_equal(class(summary(participationRisk(volatility = 3))),
               c("summaryDefault", "table"))

  # print
  expect_equal(class(print(participationRisk(volatility = 3))),
               "NULL")

})

