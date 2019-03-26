# -----------------------------------------------------------------------------
testthat::context("getSpatialData()")

testthat::test_that("handles errors correctly", {
  testthat::expect_error(getSpatialData(),
                         'argument "lon" is missing, with no default')
  testthat::expect_error(getSpatialData(0,100,SimpleCountries))
  testthat::expect_error(getSpatialData(-200, 0,SimpleCountries))
  testthat::expect_error(getSpatialData(c(-100, 10), 0, SimpleCountries))
})

testthat::test_that("returns correct name", {
  testthat::expect_match(getSpatialData(2, 47, SimpleCountries)$countryCode, "FR")
  testthat::expect_match(getSpatialData(-80, 40, SimpleCountries)$countryCode, "US")
  testthat::expect_match(getSpatialData(c(120,-17), c(-1.5,15), SimpleCountriesEEZ)$countryCode, "ID|SN")
  testthat::expect_match(getSpatialData(c(-87.1, 73.6, 26.2, -123), c(5.5, -52.9, 35.8, 48.7), SimpleCountriesEEZ)$countryCode,
                         "CR|HM|GR|US")
})

testthat::test_that("buffering works", {
  testthat::expect_match(getSpatialData(-125.395122, 48.880695, SimpleCountries, useBuffering = TRUE)$countryCode, "CA")
  testthat::expect_match(getSpatialData(-110.698377,25.200947, SimpleCountries, useBuffering = TRUE)$countryCode, "MX")
  testthat::expect_equal(getSpatialData(-117.66404, 17.675467, SimpleCountries, useBuffering = TRUE)$countryCode, NA_character_)
})

testthat::test_that("returns a dataframe", {
  testthat::expect_is(getSpatialData(120, -17, SimpleCountries), "data.frame")
  testthat::expect_is(getSpatialData(c(-100, 12), c(19, 42), SimpleCountries), "data.frame")
})
