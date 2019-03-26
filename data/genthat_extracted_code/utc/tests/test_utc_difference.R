context("main_text")

test_that("Difference_between_UTC_and_local_is_correct",{
    localtime <- Sys.time()
    expect_equal(
      format( - as.numeric(hoursUTC()) %h+% localtime, format = "%Y-%m-%d %H:%M:%S" ),
      format( toUTC(localtime), format = "%Y-%m-%d %H:%M:%S" )
    )
  }
)

test_that("hoursUTC_at_UTC",{
  localtimeUTC <- Sys.time()
  attr(localtimeUTC,"tzone") <- "UTC"
  expect_equal(
    as.numeric(hoursUTC(localtimeUTC)),
    0
  )
}
)

test_that("fromUTC_different_timeformat",{
  timeUTC <- fromUTC(
      as.POSIXct("2019-01-01 00:00",
                 tz = "UTC",
                 format = "%Y-%m-%d %H:%M"
                 ),"%Y-%m-%d %H:%M:%S")
  expect_is(
    timeUTC,
    "POSIXct"
  )
}
)
