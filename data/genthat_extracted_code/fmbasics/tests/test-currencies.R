context('Currencies')

suppressPackageStartupMessages({
  library("lubridate")
  library("fmdates")
})

test_that("Accessor methods work", {
  expect_equal(iso(AUD()), "AUD")
  expect_equal(locale(AUD()), "AUSY")
})

test_that('as.character method works', {
  expect_equal(as.character(AUD()), "AUD")
})

test_that("is.Currency method works", {
  expect_true(is.Currency(AUD()))
})

context("Currency pairs")

test_that("Remove USNY calendar works", {
  expect_equal(remove_usny(c(AUSYCalendar())), c(AUSYCalendar()))
  expect_equal(remove_usny(c(AUSYCalendar(), USNYCalendar())), c(AUSYCalendar()))
  expect_equal(remove_usny(c(AUSYCalendar(), USNYCalendar(), GBLOCalendar())),
    c(AUSYCalendar(), GBLOCalendar()))
})

test_that("Initialize method works", {
  audusd <- CurrencyPair(AUD(), USD())
  expect_equal(iso(audusd), "AUDUSD")
  audusd <- CurrencyPair(AUD(), USD(), c(AUSYCalendar(), USNYCalendar()))
  expect_equal(iso(audusd), "AUDUSD")
})

test_that("Invert method works", {
  expect_equal(invert(AUDUSD()), CurrencyPair(USD(), AUD()))
})

test_that("locale method for CurrencyPair works", {
  expect_equal(locale(AUDUSD()), c("USNY", "AUSY"))
})


test_that("is.CurrencyPair method works", {
  expect_false(is.CurrencyPair(AUD()))
  expect_true(is.CurrencyPair(AUDUSD()))
})

test_that('is_t1 method works', {
  expect_true(!is_t1(AUDUSD()))
})

test_that('Value date methods work', {
  dates <- ymd(20140416, 20140419)
  expect_equal(to_fx_value(dates, 'today', AUDUSD()), ymd(20140416, NA))
  expect_equal(to_fx_value(dates, 'spot', AUDUSD()), ymd(20140422, 20140423))
  expect_equal(to_fx_value(dates, 'tomorrow', AUDUSD()), ymd(20140417, 20140422))
  expect_equal(to_fx_value(dates, 'spot_next', AUDUSD()), ymd(20140423, 20140424))
  expect_equal(to_fx_value(dates, months(1), AUDUSD()), ymd(20140522, 20140523))
})
