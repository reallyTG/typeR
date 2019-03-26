# -----------------------------------------------------------------------------
testthat::context("getCountry()")


testthat::test_that("handles errors correctly", {
  testthat::expect_error(getCountry(),
                         'argument "lon" is missing, with no default')
  testthat::expect_error(getCountry(0,100))
})

testthat::test_that("returns correct name", {
  testthat::expect_match(getCountry(2, 47), "France")
  testthat::expect_match(getCountry(-80, 40), "United States")
  testthat::expect_match(getCountry(c(120,-17), c(-1.5,15)), "Indonesia|Senegal")
  testthat::expect_match(getCountry(c(-87.1, 26.2, -123), c(5.5, 35.8, 48.7)),
                         "Costa Rica|Greece|United States")
})

testthat::test_that("subsetting with countryCodes works", {
  testthat::expect_match(getCountry(2, 47), "France")
  testthat::expect_match(getCountry(2, 47, countryCodes=c("FR")), "France")
  testthat::expect_match(getCountry(2, 47, countryCodes="FR"), "France")
})

testthat::test_that("allData returns are correct dimension and type", {
  testthat::expect_s3_class(getCountry(2, 47, allData=TRUE), "data.frame")
  testthat::expect_equal(dim(getCountry(2, 47, allData=TRUE)), c(1,6))
  testthat::expect_s3_class(getCountry(c(120,-17), c(-1.5,15), allData=TRUE), "data.frame")
  testthat::expect_equal(dim(getCountry(c(120,-17), c(-1.5,15), allData=TRUE)), c(2,6))
})



