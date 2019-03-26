context("summary")


#----------------------------------------
# test for summary of droughts
#----------------------------------------

# synthetic time series
x <- c(rep(10,5), rep(1,20), rep(10,20), rep(1,10), rep(10,10))

synthetic_xts <- function(x) {
  y <- xts(x, order.by = seq(as.Date("2016-03-11", format = "%Y-%m-%d"), along.with = x, by = "days"))
  xtsAttributes(y)$unit <- "m^3/d"
  return(.check_xts(y))
}

dummy <- find_droughts(synthetic_xts(x),threshold = 2)
sry <- summary(dummy)

test_that("start, time and end are correct",{
  expect_equal(sry$start, as.Date(c("2016-03-16", "2016-04-25"), format="%Y-%m-%d"))
  expect_equal(sry$time, as.Date(c("2016-04-04", "2016-05-04"), format="%Y-%m-%d"))
  expect_equal(sry$end, as.Date(c("2016-04-04", "2016-05-04"), format="%Y-%m-%d"))
})

test_that("summary volume, duration, dbt and qmin is correct", {
  expect_equal(sry$volume, c(20,10))
  expect_equal(sry$duration, c(20,10))
  expect_equal(sry$dbt, c(20,10))
  expect_equal(sry$qmin, c(1,1))
})


#----------------------------------------
# test for summary of droughts with pooled data
#----------------------------------------

# synthetic time series
x <- c(rep(10,10), rep(1,20), rep(3,2), rep(1,10), rep(10,10))
synthetic_xts <- function(x) {
  y <- xts(x, order.by = seq(as.Date("2016-03-11", format = "%Y-%m-%d"), along.with = x, by = "days"))
  xtsAttributes(y)$unit <- "m^3/d"
  return(.check_xts(y))
}
dummy <- find_droughts(synthetic_xts(x),threshold = 2)
dummy_it <- pool_it(dummy, tmin = 3)
dummy_ic <- pool_ic(dummy, tmin = 3, ratio = 0.11)
dummy_sp <- pool_sp(dummy)
expect_warning(dummy_ma <- pool_ma(dummy, n = 4))
sry <- rbind(it = summary(dummy_it), ic = summary(dummy_ic), sp = summary(dummy_sp), ma = summary(dummy_ma))

test_that("start, time and end are correct",{
  expect_equal(sry$start, as.Date(c(rep("2016-03-21", 3), "2016-03-22"), format = "%Y-%m-%d"))
  expect_equal(sry$time, as.Date(c(rep("2016-04-21", 3), "2016-04-19"), format = "%Y-%m-%d"))
  expect_equal(sry$end, as.Date(c(rep("2016-04-21", 2), "2016-04-24", "2016-04-19"), format = "%Y-%m-%d"))
})
test_that("summary volume, duration, dbt and qmin is correct", {
  expect_equal(sry$volume, c(28, 28, 28, 25))
  expect_equal(sry$duration, c(32, 32, 32, 29))
  expect_equal(sry$dbt, c(30, 30, 30, 29))
  expect_equal(sry$qmin, c(1, 1, 1, 1))
})








