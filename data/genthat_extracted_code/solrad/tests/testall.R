context("all")

solar <- Solar(DOY = seq(0, 2, .05),
               Lat = 45,
               Lon = 10,
               SLon = 10,
               DS = 0,
               Elevation = 1000,
               Slope = 10,
               Aspect = 0)


test_that("test Declination", {
  expect_equal(floor(solar$Declination[1]*100), -2309)
})

test_that("test Sunset", {
  expect_equal(floor(solar$Sunset[1]*100), 431)
})

test_that("test Sunrise", {
  expect_equal(floor(solar$Sunrise[1]*100), -432)
})

test_that("test Altitude", {
  expect_equal(floor(solar$Altitude[1]*100), -6808)
})

test_that("test Azimuth", {
  expect_equal(floor(solar$Azimuth[1]*100), -17800)
})

test_that("test Incidence", {
  expect_equal(floor(solar$Incidence[1]*100), 16806)
})
test_that("test Sextr", {
  expect_equal(floor(solar$Sextr[1]*100), 141118)
})

test_that("test Sopen", {
  expect_equal(floor(solar$Sopen[10]*100), 69239)
})

test_that("test Sdiropen", {
  expect_equal(floor(solar$Sdiropen[10]*100), 33833)
})

test_that("test Sdifopen", {
  expect_equal(floor(solar$Sdifopen[10]*100), 999)
})

