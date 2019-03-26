context("Shifters")

suppressPackageStartupMessages(library("lubridate"))

test_that("Shift method works as expected", {
  ausy <- AUSYCalendar()
  expect_identical(shift(ymd("20120229"), months(1), "u", ausy, FALSE), ymd("20120329"))
  expect_identical(shift(ymd("20120228"), months(1), "u", ausy, FALSE), ymd("20120328"))
  expect_identical(shift(ymd("20120331"), months(1), "u", ausy, FALSE), ymd("20120430"))
  expect_identical(shift(ymd("20120229"), years(1), "u", ausy, FALSE), ymd("20130228"))
  expect_identical(shift(ymd("20120229"), months(1), "u", ausy, TRUE), ymd("20120330"))
  expect_identical(shift(ymd("20120229"), years(1), "u", ausy, FALSE), ymd("20130228"))
  expect_identical(shift(ymd("20120229"), years(1), "u", ausy, TRUE), ymd("20130228"))
  expect_identical(shift(ymd("20120424"), days(1), "u", ausy, TRUE), ymd("20120426"))
  expect_identical(shift(ymd("20120430"), months(1), "u", ausy, FALSE), ymd("20120530"))
  expect_identical(shift(ymd("20120430"), months(1), "u", ausy, TRUE), ymd("20120531"))
  expect_identical(shift(ymd("20120331"), months(1), "u", ausy, FALSE), ymd("20120430"))
  expect_identical(shift(ymd("20120331"), months(1), "u", ausy, TRUE), ymd("20120430"))
  expect_identical(shift(ymd("20121225"), days(10), "mf", ausy, TRUE), ymd("20130110"))
  expect_identical(shift(ymd(20110429), months(1), 'mf', ausy, TRUE), ymd(20110531))
  expect_identical(shift(ymd("20120601"), years(1) - days(1), "mf", ausy, FALSE), ymd("20130531"))
  gblo <- GBLOCalendar()
  expect_identical(shift(ymd("20151127"), days(-2), "mf", gblo, TRUE), ymd("20151125"))
  expect_identical(shift(ymd("20151127"), days(2), "mf", gblo, TRUE), ymd("20151201"))
  expect_identical(shift(ymd("20151127"), days(0), "mf", gblo, TRUE), ymd("20151127"))
})


test_that("Shift returns message when expected", {
  expect_message(shift(ymd("20120229"), minutes(1), "u", AUSYCalendar(), FALSE))
})