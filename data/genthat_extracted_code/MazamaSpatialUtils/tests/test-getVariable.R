# -----------------------------------------------------------------------------
testthat::context("getVariable()")


testthat::test_that("handles errors correctly", {
  testthat::expect_error(getVariable(dataset = "SimpleCountries"),
                         'argument "lon" is missing, with no default')
  testthat::expect_error(getVariable(0,100, dataset = "SimpleCountries"))
  testthat::expect_error(getVariable(10, 10), "Missing database")
})

testthat::test_that("returns correct name", {
  testthat::expect_match(getVariable(2, 47, dataset = "SimpleCountries", variable = "countryName"), "France")
  testthat::expect_match(getVariable(2, 47, dataset = "SimpleCountries", variable = "countryCode"), "FR")
  testthat::expect_match(getVariable(-80, 40, dataset = "SimpleCountriesEEZ", variable = "countryName"), "United States")
  testthat::expect_match(getVariable(c(120,-17), c(-1.5,15), dataset = "SimpleCountries", variable = "countryName"), "Indonesia|Senegal")
  testthat::expect_match(getVariable(c(-87.1, 26.2, -123), c(5.5, 35.8, 48.7), 
                                     dataset = "SimpleCountriesEEZ", variable = "countryName"),
                         "Costa Rica|Greece|United States")
})

testthat::test_that("subsetting with countryCodes works", {
  testthat::expect_match(getVariable(2, 47, dataset = "SimpleCountries", variable = "countryName", countryCodes=c("FR")), "France")
  testthat::expect_match(getVariable(2, 47, dataset = "SimpleCountries", variable = "countryName", countryCodes="FR"), "France")
  testthat::expect_equal(getVariable(c(2.1, -108), c(41.38, 48), dataset = "SimpleCountries", variable = "countryName", countryCodes="ES"), 
                         c("Spain", NA_character_))
})

testthat::test_that("allData returns are correct dimension and type", {
  testthat::expect_s3_class(getVariable(2, 47, dataset = "SimpleCountries", allData=TRUE), "data.frame")
  testthat::expect_equal(dim(getVariable(2, 47, dataset = "SimpleCountriesEEZ",  allData=TRUE)), c(1,6))
  testthat::expect_s3_class(getVariable(c(120,-17), c(-1.5,15), dataset = "SimpleCountries", allData=TRUE), "data.frame")
  testthat::expect_equal(dim(getVariable(c(120,-17), c(-1.5,15), dataset = "SimpleCountriesEEZ", allData=TRUE)), c(2,6))
})



