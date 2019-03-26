context("Methods")

suppressPackageStartupMessages(library(lubridate))

test_that("is_eom works as expected", {
  expect_identical(is_eom(ymd("2011-02-28")), TRUE)
  expect_identical(is_eom(ymd("2012-02-28")), FALSE)
  expect_identical(is_eom(ymd("2012-02-29")), TRUE)
})

test_that("eom works as expected", {
  expect_identical(eom(ymd(20120203, 20140203)), ymd(20120229, 20140228))
})

test_that("Julian day works:", {
  expect_identical(to_jd(ymd(19571004) + seconds(0.81*24*60*60)), 2436116.31)
  expect_identical(to_jd(ymd_hms(20000101120000)), 2451545.0)
  expect_identical(to_jd(ymd(19000101)), 2415020.5)
})
