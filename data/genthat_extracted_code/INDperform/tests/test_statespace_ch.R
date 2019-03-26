context("test statespace_ch")

dat <- statespace_ch(x = rnorm(30, 9, 2.5), y = rnorm(30,
  0.5, 0.05), time = 1979:2008, period_ref = 1979:1983,
  period_current = 2004:2008)

test_that("test structure of returned object", {
  expect_true(is.list(dat))
  expect_length(dat, 7)
  expect_named(dat, c("ch_ref", "ch_cur", "inside_ch_ref",
    "xy", "time", "period_ref", "period_current"))
  expect_is(dat$ch_ref, "integer")  # checked via typeof() when vector
  expect_is(dat$ch_cur, "integer")
  expect_is(dat$inside_ch_ref, "logical")
  expect_length(dat$inside_ch_ref, length(2004:2008))
  expect_is(dat$xy, "data.frame")  # checked via class()
  expect_equal(dim(dat$xy), c(30, 2))
  expect_true(is.numeric(dat$time))
  expect_true(is.numeric(dat$period_ref))
  expect_true(is.numeric(dat$period_current))
})


test_that("test convex hull", {
  expect_equal(dplyr::first(dat$ch_ref), dplyr::last(dat$ch_ref))
  expect_equal(dplyr::first(dat$ch_cur), dplyr::last(dat$ch_cur))
})

# Test of data input validation

x <- ind_ex$TZA
y <- ind_ex$MS
time <- ind_ex$Year
period_ref <- 1979:1981
period_ref2 <- 1975:1980
period_current <- 2004:2008
period_current2 <- 2008:2011

test_that("test error messages", {
  # missing arguments
  expect_error(statespace_ch(y = y, time = time,
    period_ref = period_ref, period_current = period_current),
    "Argument x is missing")
  expect_error(statespace_ch(x = x, time = time,
    period_ref = period_ref, period_current = period_current),
    "Argument y is missing")
  expect_error(statespace_ch(x = x, y = y, period_ref = period_ref,
    period_current = period_current), "Argument time is missing")
  expect_error(statespace_ch(x = x, y = y, time = time,
    period_current = period_current), "Argument period_ref is missing")
  expect_error(statespace_ch(x = x, y = y, time = time,
    period_ref = period_ref), "Argument period_current is missing")

  # check of inputs
  expect_error(statespace_ch(as.data.frame(x), y,
    time, period_ref, period_current), "x has to be a VECTOR!")
  expect_error(statespace_ch(x, as.character(y),
    time, period_ref, period_current), "y has to be an INTEGER vector!")
  expect_error(statespace_ch(x, y, as.character(time),
    period_ref, period_current), "time has to be an INTEGER vector!")
  expect_error(statespace_ch(x, y, time, period_current))
  expect_error(statespace_ch(x, y, period_ref, period_current))

  # check length difference error message
  expect_error(statespace_ch(x[-1], y, time, period_ref,
    period_current))
  expect_error(statespace_ch(x, y[-1], time, period_ref,
    period_current))
  expect_error(statespace_ch(x, y, time[-1], period_ref,
    period_current))

  # periods are partly outside the time series
  # (1979:2008)
  expect_error(statespace_ch(x, y, time, period_ref,
    period_current2))
  expect_error(statespace_ch(x, y, time, period_ref2,
    period_current))
  # periods do not contain minimum of 3 years
  expect_error(statespace_ch(x, y, time, period_ref = 1980,
    period_current))
  expect_error(statespace_ch(x, y, time, period_ref,
    period_current = 2007:2008))
  expect_error(statespace_ch(x, y, time, period_ref = 1980,
    period_current = 2007:2008))
})
