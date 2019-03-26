# -----------------------------------------------------------------------------
context("getTimezone()")

testthat::test_that("get functions return correct name", {
  testthat::expect_match(getTimezone(2, 47), "Europe/Paris")
  testthat::expect_match(getTimezone(-80, 40), "America/New_York")
  testthat::expect_match(getTimezone(c(120,-7), c(-1.5,15)), "Asia/Makassar|Africa/Bamako")
})

testthat::test_that("subsetting with countryCodes works", {
  testthat::expect_match(getTimezone(2, 47), "Europe/Paris")
  testthat::expect_match(getTimezone(2, 47, countryCodes=c("FR")), "Europe/Paris")
  testthat::expect_match(getTimezone(2, 47, countryCodes="FR"), "Europe/Paris")
})

testthat::test_that("allData returns are correct dimension and type", {
  testthat::expect_s3_class(getTimezone(2, 47, allData=TRUE), "data.frame")
  testthat::expect_equal(dim(getTimezone(2, 47, allData=TRUE)), c(1,7))
  testthat::expect_s3_class(getTimezone(c(120,-17), c(-1.5,15), allData=TRUE), "data.frame")
  testthat::expect_equal(dim(getTimezone(c(120,-17), c(-1.5,15), allData=TRUE)), c(2,7))
})

testthat::test_that("getPolygonID handles errors correctly", {
  testthat::expect_error(getPolygonID(iris))
  testthat::expect_is(getPolygonID(SimpleTimezones), "character")
  testthat::expect_is(getPolygonID(SimpleCountries), "character")
})
