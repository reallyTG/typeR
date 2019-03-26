
set.seed(8675309)

dat <- makeFakeData()

context("chkstop_minmax testing")

test_that("chk_imin and chk_imax return TRUE when input is OK", {
  expect_equal(chk_imin(dat, 0), TRUE)
  expect_equal(chk_imin(dat, -1), TRUE)
  expect_equal(chk_imin(dat, -100), TRUE)
  expect_equal(chk_imax(dat, 4), TRUE)
  expect_equal(chk_imax(dat, 5), TRUE)
  expect_equal(chk_imax(dat, 500), TRUE)
})

test_that("chk_imin and chk_imax return FALSE when input is Bad", {
  expect_equal(chk_imin(dat, 0.1), FALSE)
  expect_equal(chk_imin(dat, 1), FALSE)
  expect_equal(chk_imin(dat, 10), FALSE)
  expect_equal(chk_imax(dat, 3), FALSE)
  expect_equal(chk_imax(dat, 2), FALSE)
  expect_equal(chk_imax(dat, 1), FALSE)
  expect_equal(chk_imax(dat, 0), FALSE)
  expect_equal(chk_imax(dat, -100), FALSE)
})

test_that("chkstop_minmax: error if imax <= imin", {
  expect_error(chkstop_minmax(dfItems = dat, minmax = c(4, 4)),
               "Your max is not greater than your min")
  expect_error(chkstop_minmax(dfItems = dat, minmax = c(0, 0)),
               "Your max is not greater than your min")
  expect_error(chkstop_minmax(dfItems = dat, minmax = c(4, 0)),
               "Your max is not greater than your min")
})

test_that("chkstop_minmax: error if minmax != 2, or if minmax is not numeric", {
  expect_error(chkstop_minmax(dfItems = dat, minmax = 1),
               "provide a valid numeric range")
  expect_error(chkstop_minmax(dfItems = dat, minmax = c(1,2,3)),
               "provide a valid numeric range")
  expect_error(chkstop_minmax(dfItems = dat, minmax = c("0", "4")),
               "provide a valid numeric range")
})

test_that("chkstop_minmax: error if any value < minmax[1]", {
  expect_error(chkstop_minmax(dfItems = dat, minmax = c(0.1, 4)),
               "minimum value you gave")
  expect_error(chkstop_minmax(dfItems = dat, minmax = c(1, 4)),
               "minimum value you gave")
  expect_error(chkstop_minmax(dfItems = dat, minmax = c(2, 4)),
               "minimum value you gave")
  expect_error(chkstop_minmax(dfItems = dat, minmax = c(3, 4)),
               "minimum value you gave")
})

test_that("chkstop_minmax: error if any value > minmax[2]", {
  expect_error(chkstop_minmax(dfItems = dat, minmax = c(0, 3.9)),
               "maximum value you gave")
  expect_error(chkstop_minmax(dfItems = dat, minmax = c(0, 3)),
               "maximum value you gave")
  expect_error(chkstop_minmax(dfItems = dat, minmax = c(0, 2)),
               "maximum value you gave")
  expect_error(chkstop_minmax(dfItems = dat, minmax = c(0, 1)),
               "maximum value you gave")
})

test_that("chkstop_minmax: silent if minmax == c(0, 4) (for this example)", {
  expect_silent(chkstop_minmax(dfItems = dat, minmax = c(0, 4)))
})
test_that("chkstop_minmax: silent if minmax == c(0, 5) (for this example)", {
  expect_silent(chkstop_minmax(dfItems = dat, minmax = c(0, 5)))
})
test_that("chkstop_minmax: silent if minmax == c(-1, 4) (for this example)", {
  expect_silent(chkstop_minmax(dfItems = dat, minmax = c(-1, 4)))
})

test_that("scoreScale: Output is a df", {
  expect_true(is.data.frame(scoreScale(df = mtcars, type = "sum")))
  expect_true(is.data.frame(scoreScale(df = mtcars, type = "sum", keepNvalid = TRUE)))
})


rm(dat)
