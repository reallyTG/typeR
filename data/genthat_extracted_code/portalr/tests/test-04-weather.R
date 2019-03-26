context("checks weather summary output")

portal_data_path <- tempdir()
daily_weather = weather("daily", path = portal_data_path)
monthly_weather = weather("monthly", path = portal_data_path)
newmoon_weather = weather("newmoon", path = portal_data_path)

test_that("'Daily' option returns 9 columns", {
  expect_that(dim(daily_weather)[2], equals(9))
  expect_equal(colnames(daily_weather),
               c("year", "month", "day", "mintemp", "maxtemp", "meantemp",
                 "precipitation", "locally_measured", "battery_low"))
})

test_that("Daily temperatures ok", {
  expect_that(length(which((daily_weather$mintemp <= daily_weather$maxtemp) == FALSE)),equals(0))
  expect_that(length(which((daily_weather$meantemp <= daily_weather$maxtemp) == FALSE)),equals(0))
  expect_that(length(which((daily_weather$mintemp <= daily_weather$meantemp) == FALSE)),equals(0))
})

test_that("Monthly option returns 8 columns", {
  expect_that(dim(monthly_weather)[2], equals(8))
  expect_that(sum(colnames(monthly_weather) == c("year", "month", "mintemp", "maxtemp", "meantemp", "precipitation", "locally_measured", "battery_low")), equals(8))
})

test_that("Monthly temperatures ok", {
  expect_that(length(which((monthly_weather$mintemp <= monthly_weather$maxtemp) == FALSE)),equals(0))
  expect_that(length(which((monthly_weather$meantemp <= monthly_weather$maxtemp) == FALSE)),equals(0))
  expect_that(length(which((monthly_weather$mintemp <= monthly_weather$meantemp) == FALSE)),equals(0))
})

test_that("Newmoon option returns 8 columns", {
  expect_that(dim(newmoon_weather)[2], equals(8))
  expect_that(sum(colnames(newmoon_weather) == c("newmoonnumber", "date", "mintemp", "maxtemp", "meantemp", "precipitation", "locally_measured", "battery_low")), equals(8))
})

test_that("Newmoon temperatures ok", {
  expect_that(length(which((newmoon_weather$mintemp <= newmoon_weather$maxtemp) == FALSE)),equals(0))
  expect_that(length(which((newmoon_weather$meantemp <= newmoon_weather$maxtemp) == FALSE)),equals(0))
  expect_that(length(which((newmoon_weather$mintemp <= newmoon_weather$meantemp) == FALSE)),equals(0))
})
