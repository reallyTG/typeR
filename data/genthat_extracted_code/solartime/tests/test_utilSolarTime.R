.tmp.f <- function(){
  require(testthat)
}
context("utilSolarTime")

test_that("computeSolarToLocalTimeDifference",{
  today <- 340
  longDeg <- 11.586
  doi <- 1:366
  # regression tests
  localDiff <- computeSolarToLocalTimeDifference(longDeg, 1L)
  expect_equal( localDiff, -0.23, tolerance = 5e-3, scale = 1)
  localDiffToday <- computeSolarToLocalTimeDifference(
    longDeg, 1L, doy = today + (0:2))
  expect_equal( length(localDiffToday), 3L)
  expect_equal( localDiffToday, c(-0.073, -0.080, -0.087)
                , tolerance = 5e-4, scale = 1)
})

test_that("computeSunriseHourDoy",{
  today <- 340
  # regression tests
  sunriseSolar <- computeSunriseHourDoy(
    today, latDeg = 51, isCorrectSolartime = FALSE)
  sunriseLocaltime <- computeSunriseHourDoy(
    today, latDeg = 51, longDeg = 11.586, timeZone = +1)
  expect_equal( sunriseSolar, 8.03, tolerance = 5e-3, scale = 1)
  expect_equal( sunriseLocaltime, 8.11, tolerance = 5e-3, scale = 1)
})

test_that("computeSunsetHourDoy",{
  today <- 340
  # regression tests
  sunsetSolar <- computeSunsetHourDoy(
    today, latDeg = 51, isCorrectSolartime = FALSE)
  sunsetLocaltime <- computeSunsetHourDoy(
    today, latDeg = 51, longDeg = 11.586, timeZone = +1)
  expect_equal( sunsetSolar, 15.97, tolerance = 5e-3, scale = 1)
  expect_equal( sunsetLocaltime, 16.04, tolerance = 5e-3, scale = 1)
})

test_that("computeDayLengthDoy",{
  today <- 340
  # regression tests
  dayLength <- computeDayLengthDoy(today, latDeg = 51)
  expect_equal( dayLength, 7.93, tolerance = 5e-3, scale = 1)
  # testing north pole
  dayLengthNP <- computeDayLengthDoy( c(1,180), latDeg = +80)
  expect_equal( dayLengthNP, c(0,24))
  # testing south pole
  dayLengthSP <- computeDayLengthDoy( c(1,180), latDeg = -80)
  expect_equal( dayLengthSP, c(24,0))
})

test_that("computeSunPostionDoyHour",{
  today <- 340
  # test that elevation at sunrise is close to 0
  # first with hours specified in solar time
  sunrise <- computeSunriseHourDoy(today, latDeg = 51, isCorrectSolartime = FALSE)
  sunpos <- computeSunPositionDoyHour(
    today, sunrise, latDeg = 51, isCorrectSolartime = FALSE)
  expect_true( is.matrix(sunpos))
  expect_equal( nrow(sunpos), 1L )
  expect_equivalent( sunpos[1L,"hour"], sunrise)
  expect_equal( as.vector(sunpos[1L,"elevation"]), 0, tolerance = 1e-10)
  # and with converting to local time
  sunrise <- computeSunriseHourDoy(
    today, latDeg = 51, longDeg = 11.586, timeZone = +1)
  sunpos <- computeSunPositionDoyHour(
    today, sunrise, latDeg = 51, longDeg = 11.586, timeZone = +1)
  expect_true( sunpos[1L,"hour"] < sunrise) # solar time is later
  expect_equal( as.vector(sunpos[1L,"elevation"]), 0, tolerance = 1e-10)
  #
  # test that elevation at sunset is close to 0
  # first with hours specified in solar time
  sunset <- computeSunsetHourDoy(today, latDeg = 51, isCorrectSolartime = FALSE)
  sunpos <- computeSunPositionDoyHour(
    today, sunset, latDeg = 51, isCorrectSolartime = FALSE)
  expect_true( is.matrix(sunpos))
  expect_equal( nrow(sunpos), 1L )
  expect_equivalent( sunpos[1L,"hour"], sunset)
  expect_equal( as.vector(sunpos[1L,"elevation"]), 0, tolerance = 1e-10)
  # and with converting to local time
  sunset <- computeSunsetHourDoy(
    today, latDeg = 51, longDeg = 11.586, timeZone = +1)
  sunpos <- computeSunPositionDoyHour(
    today, sunset, latDeg = 51, longDeg = 11.586, timeZone = +1)
  expect_true( sunpos[1L,"hour"] < sunset) # solar time is later
  expect_equal( as.vector(sunpos[1L,"elevation"]), 0, tolerance = 1e-10)
})

test_that("getSolarTimeHour",{
  today <- ISOdatetime(2010,5,1,8,0,0, tz = "Etc/GMT-1")
  solarHour <- getSolarTimeHour(today, longDeg = 11.586)
  # Chemnitz is about 12 minutes behing GTM-1
  expect_true( solarHour > 7)
  expect_true( solarHour < 8)
})

test_that("computeSunPostion",{
  today <- ISOdatetime(2010,5,1,8,0,0, tz = "Etc/GMT-1")
  ans <- computeSunPosition(today, latDeg = 51, longDeg = 11.586)
  # Chemnitz is about 12 minutes behing GTM-1
  expect_true( ans[,"hour"] > 7)
  expect_true( ans[,"hour"] < 8)
})

test_that("computeIsDayByLocation",{
  today <- 340
  midnight <- as.POSIXct("2017-12-06", tz = "Etc/GMT-1")
  # test that elevation at sunrise is close to 0
  # first with hours specified in solar time
  # and with converting to local time
  sunrise <- computeSunriseHourDoy(
    today, latDeg = 51, longDeg = 11.586, timeZone = +1)
  sunset <- computeSunsetHourDoy(
    today, latDeg = 51, longDeg = 11.586, timeZone = +1)
  # one second before and after sunrise (at sunrise numerical erros confound)
  isDaySunrise <- computeIsDayByLocation( midnight + sunrise*3600 + c(-1L,+1L)
                          , latDeg = 51, longDeg = 11.586, timeZone = +1)
  expect_equal(isDaySunrise, c(FALSE, TRUE))
  isDaySunset <- computeIsDayByLocation(
    midnight + sunset*3600 + c(-1L,+1L)
    , latDeg = 51, longDeg = 11.586, timeZone = +1)
  expect_equal(isDaySunset, c(TRUE, FALSE))
})

test_that("computeIsDayByLocation omit geocoordinates",{
  today <- 340
  midnight <- as.POSIXct("2017-12-06", tz = "Etc/GMT-1")
  # test that elevation at sunrise is close to 0
  # first with hours specified in solar time
  # and with converting to local time
  sunrise <- computeSunriseHourDoy(
    today, latDeg = 51, longDeg = 11.586, timeZone = +1
    , isCorrectSolartime = FALSE)
  sunset <- computeSunsetHourDoy(
    today, latDeg = 51, longDeg = 11.586, timeZone = +1
    , isCorrectSolartime = FALSE)
  # one second before and after sunrise (at sunrise numerical erros confound)
  isDaySunrise <- computeIsDayByLocation(
    midnight + sunrise*3600 + c(-1L,+1L), timeZone = +1
    , latDeg = 51, longDeg = NA, isCorrectSolartime = FALSE)
  expect_equal(isDaySunrise, c(FALSE, TRUE))
  isDaySunset <- computeIsDayByLocation(
    midnight + sunset*3600 + c(-1L,+1L), timeZone = +1
    , latDeg = 51, longDeg = NA, isCorrectSolartime = FALSE)
  expect_equal(isDaySunset, c(TRUE, FALSE))
})

