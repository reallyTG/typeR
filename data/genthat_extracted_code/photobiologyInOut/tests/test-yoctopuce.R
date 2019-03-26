library("photobiology")
library("photobiologyInOut")
library("lubridate")
library("readr")

context("YoctoPuce")

test_that("read CSV", {

  file.name <- 
    system.file("extdata", "yoctopuce-data.csv", 
                package = "photobiologyInOut", mustWork = TRUE)

  yoctopuce.tb <- 
    read_yoctopuce_csv(file = file.name, n_max = 100)
  
  expect_equal(nrow(yoctopuce.tb), 100L)
  expect_equal(ncol(yoctopuce.tb), 10L)
  expect_is(yoctopuce.tb, "tbl_df")
  expect_is(yoctopuce.tb, "data.frame")
  expect_is(yoctopuce.tb[["ISO.time"]], "POSIXct")
  expect_is(yoctopuce.tb[["temperature.min"]], "numeric")
  expect_is(yoctopuce.tb[["humidity.max"]], "numeric")

  expect_equal(yoctopuce.tb[["ISO.time"]][1],
               lubridate::ymd_hms("2017-09-03 13:00:00"))
  
  expect_equal(sum(is.na(yoctopuce.tb[["ISO.time"]])), 0)
  expect_equal(sum(is.na(yoctopuce.tb[["temperature.min"]])), 0)
  expect_named(
    yoctopuce.tb,
    c(
      "ISO.time",
      "temperature.min",
      "temperature.avg",
      "temperature.max",
      "pressure.min",
      "pressure.avg",
      "pressure.max",
      "humidity.min",   
      "humidity.avg",
      "humidity.max"
    )
  )
  expect_equal(length(comment(yoctopuce.tb)), 1L)

  skip_on_cran()

  yoctopuce_skip.tb <- 
    read_yoctopuce_csv(file = file.name, n_max = 100, data_skip = 24)
  
  expect_equal(nrow(yoctopuce_skip.tb), 100L)
  expect_equal(ncol(yoctopuce_skip.tb), 10L)
  expect_is(yoctopuce_skip.tb, "tbl_df")
  expect_is(yoctopuce_skip.tb, "data.frame")
  expect_is(yoctopuce_skip.tb[["ISO.time"]], "POSIXct")
  expect_is(yoctopuce_skip.tb[["temperature.min"]], "numeric")
  expect_is(yoctopuce_skip.tb[["humidity.max"]], "numeric")
  
  expect_equal(yoctopuce_skip.tb[["ISO.time"]][1],
               lubridate::ymd_hms("2017-09-04 13:00:00"))
  
  expect_equal(sum(is.na(yoctopuce_skip.tb[["ISO.time"]])), 0)
  expect_equal(sum(is.na(yoctopuce_skip.tb[["temperature.min"]])), 0)
  expect_named(
    yoctopuce_skip.tb,
    c(
      "ISO.time",
      "temperature.min",
      "temperature.avg",
      "temperature.max",
      "pressure.min",
      "pressure.avg",
      "pressure.max",
      "humidity.min",   
      "humidity.avg",
      "humidity.max"
    )
  )
  expect_equal(length(comment(yoctopuce_skip.tb)), 1L)
  
})
