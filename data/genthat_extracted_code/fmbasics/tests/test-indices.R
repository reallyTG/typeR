context('Indices')

suppressPackageStartupMessages({
  library(lubridate)
  library(fmdates)
})

test_that("Initialiser", {
  ibor <- AUDBBSW(months(3))
  expect_true(is.IborIndex(ibor))
  expect_true(is.Index(ibor))
  onia <- AONIA()
  expect_true(is.CashIndex(onia))
})

test_that("Index shifters", {
  expect_equal(to_reset(ymd(20170103), AUDBBSW(months(3))), ymd(20170103))
  expect_equal(to_value(ymd(20170103), AUDBBSW(months(3))), ymd(20170103))
  expect_equal(to_maturity(ymd(20170103), AUDBBSW(months(3))), ymd(20170403))
})
