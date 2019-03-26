context("Pooling")

#----------------------------------------
# test for ic and it pooling
#----------------------------------------


# setup synthetic time series
n <- 3
x <- c(rep(1, n), 10, rep(1, n))

timeSeries <- list(x,
                   c(10, x),
                   c(x, 10),
                   c(10, x, 10))

create_lf2 <- function(x) {
  y <- xts(x, order.by = seq(Sys.Date(), along.with = x, by = "days"))

  # using "m^3/d" makes computing the deficit volume easy
  flowunit(y) <- "m^3/d"

  return(lfstat:::.check_xts(y))
}

timeSeries <- lapply(timeSeries, function(x) find_droughts(create_lf2(x), threshold = 2))



test_that("ic and it pooling works", {
  for(i in seq_along(timeSeries)){

    test_that("tmin = 0 does no pooling", {
      pooled <- pool_it(timeSeries[[i]], tmin = 0)
      expect_equal(as.vector(pooled$event.no),
                   as.vector(pooled$event.orig))
    })

    test_that("drought durations and volumes are correct", {
      smry <- summary(pool_it(timeSeries[[i]]), drop_minor = 0)
      # durations include inter-event time
      expect_equal(smry$duration, 7)

      # durations include inter-event time
      expect_equal(smry$dbt, 6)

      # inter-event volumes reduce deficit volume
      expect_equal(smry$volume, -2)


    })
  }
})



#----------------------------------------
# tests for pooling with NA values
#----------------------------------------

# NA prevents pooling

# setup synthetic time series with NA
n <- 3
y <- c(rep(1, n), 4, rep(1, n), rep(10, n))
l <- length(y)

# create three time series with a single NA value each,
#   - NA at the beginning,
#   - NA inbetween
#   - NA at the very end
timeSeries <- list(c(1, NA, y),
                   c(y[1:(l/2)], 1, NA, y[(l/2):l]),
                   c(1, y, NA))

timeSeries <- suppressWarnings(
  lapply(timeSeries,
         function(x) find_droughts(create_lf2(x), threshold = 2)))

test_that("pool_sp(): NA values are never pooled, therefore event.no == 0 after pooling",{
  for (i in seq_along(timeSeries)){
    pooled <- pool_sp(timeSeries[[i]])
    expect_equal(as.vector(pooled$event.no[is.na(pooled$discharge)]), 0)
  }
})


test_that("pool_it() can merge two events just separated by an NA value",{

  smry <- lapply(timeSeries, function(x) summary(pool_it(x, tmin = 1)))

  # deficit volume and days below threshold will become NA
  expect_equal(as.numeric(smry[[2]][1, c("volume", "dbt")]), rep(NA_real_, 2))
  expect_equal(as.numeric(smry[[2]][1, c("volume", "dbt")]), rep(NA_real_, 2))

  # qmin and tqmin show values
  expect_true(all(!is.na(smry[[1]][1, c("qmin", "tqmin")])))
  expect_true(all(!is.na(smry[[2]][1, c("qmin", "tqmin")])))

  # third time series should have no NAs in summary as the non-finite flow is
  # the last element
  expect_true(all(!is.na(smry[[3]][1, ])))
  expect_equal(as.numeric(smry[[3]][1, c("duration", "dbt", "volume", "qmin")]),
               c(8, 7, 5, 1))

  # if tqmin is not unique, take the date
  expect_equal(smry[[3]]$tqmin, time(timeSeries[[3]])[1])
})


test_that("user is warned if minor events are filtered",{

  smry <- lapply(timeSeries, function(x)
    summary(pool_it(x, tmin = 1),
            drop_minor = c("volume" = 0, "duration" = 100)))

  # warum funktioniert drop minor nur bei event 3? weil wenn vol = NA, do not drop
})


# todo
test_that("volumes are correct, units work",{

  smry <- summary(pool_sp(timeSeries[[1]]))
  smry

})




