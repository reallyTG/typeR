context("Adjusters")

suppressPackageStartupMessages(library("lubridate"))

test_that("Adjust method works as expected", {
  ausy <- AUSYCalendar()
  gblo <- GBLOCalendar()
  sylo <- JointCalendar(list(ausy, gblo), all)
  expect_identical(adjust(ymd("20120102"), "u", ausy), ymd("20120102"))
  expect_identical(adjust(ymd("20120102"), "f", ausy), ymd("20120103"))
  expect_identical(adjust(ymd("20120331"), "mf", ausy), ymd("20120330"))
  expect_identical(adjust(ymd("20120102"), "p", ausy), ymd("20111230"))
  expect_identical(adjust(ymd("20120102"), "mp", ausy), ymd("20120103"))
  expect_identical(adjust(ymd("20120115"), "ms", ausy), ymd("20120113"))
  expect_identical(adjust(ymd("20121225"), "mf", sylo), ymd("20121227"))
})
