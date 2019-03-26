context('Epochs')

suppressPackageStartupMessages(library(lubridate))

test_that('Easter Monday calculations work:', {
  expect_identical(easter_monday(c(1963, 2013)), yday(ymd(19630415, 20130401)))
})

test_that("delta_t correct to within five second:", {
  # http://maia.usno.navy.mil/ser7/deltat.data
  expect_equal(delta_t(ymd(19730201, 20100401, 20130901, 20151201, tz = "UTC")),
    c(43.4724, 66.1683, 67.1458, 68.0514), tolerance = 1, scale = 1)
})

test_that("Julian day number converter works:", {
  # Based on example in Meeus et all pg 62
  expect_equal(julian_day_to_gregorian(2451545),
    ISOdate(2000, 1, 1, hour = 0, tz = "UTC") + .5 * 24 * 60 * 60)
  expect_equal(julian_day_to_gregorian(2447187.5),
    ISOdate(1988, 1, 27, hour = 0, tz = "UTC"))
})

test_that('Equinox dates are correct:', {
  # From Astronomical Calculations, Jean & Meeus, Table 26.e,
  # March equinox. Testing to within 15 minutes of accuracy which is all that
  # we should need for the purposes of this package.
  expect_equal(equinox(c(1991:1995, 1999), season = 'mar', want_dt = TRUE),
    floor_date(ymd_hms(19910321030254, 19920320084902, 19930320144138, 19940320202901,
      19950321021527, 19990321014653), "minute"), tolerance = 2 * 60)
  # Sept equinox
  expect_equal(equinox(c(1993, 1997), season='sep', want_dt = TRUE),
    floor_date(ymd_hms(19930923002329, 19970922235649), "minute"),
    tolerance = 2 * 60)
  # http://aa.usno.navy.mil/data/docs/EarthSeasons.php
  expect_equal(equinox(2021, season = "sep", want_dt = TRUE),
    ymd_hms(20210922192100), tolerance = 2 * 60)
})

test_that("Moon phase dates are correct:", {
  # To within one second. From Meeus exercises p323
  expect_equal(next_moon_phase(ymd(19770215), "new", want_dt = TRUE),
    ymd_hms(19770218033741), tolerance = 1)
  expect_equal(next_moon_phase(ymd(20440101), "last", want_dt = TRUE),
    ymd_hms(20440121234815), tolerance = 1)
  # From:
  # http://www.timeanddate.com/calendar/moonphases.html
  # Expected results are based on AEST.
  expect_equal(next_moon_phase(ymd(20160801), "first", want_dt = FALSE),
    with_tz(ymd_hm(201608110420, tz = "Australia/Sydney"), tz = "UTC"),
    tolerance = 60)
  expect_equal(next_moon_phase(ymd(20161101), "full", want_dt = FALSE),
    with_tz(ymd_hm(201611150052, tz = "Australia/Sydney"), tz = "UTC"),
    tolerance = 60)
})

test_that("Chinese NY dates are correct:", {
  expect_equal(lubridate::as_date(chinese_new_year(2015:2018)),
    as.Date(c("2015-02-19", "2016-02-08", "2017-01-28", "2018-02-16")))
})
