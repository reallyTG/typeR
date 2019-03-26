testthat::context("Test bounding box generation")

testthat::test_that("Individual values can be turned into a bounding box", {

  result <- bounding_wkt(10, 12, 14, 16)
  testthat::expect_equal(result, "POLYGON((10 12,10 16,14 16,14 12,10 12))")
  testthat::expect_length(result, 1)
  testthat::expect_type(result, "character")
})

testthat::test_that("Listed values can be turned into a bounding box", {

  result <- bounding_wkt(values = list(c(10, 12, 14, 16)))
  testthat::expect_equal(result, "POLYGON((10 12,10 16,14 16,14 12,10 12))")
  testthat::expect_length(result, 1)
  testthat::expect_type(result, "character")
})

testthat::test_that("Individual value bounding-box generation handles NAs", {

  result <- bounding_wkt(10, NA_complex_, 14, 16)
  testthat::expect_length(result, 1)
  testthat::expect_type(result, "character")
  testthat::expect_true(is.na(result))
})

testthat::test_that("Listed value bounding-box generation handles NAs", {

  result <- bounding_wkt(values = list(c(NA_complex_, 12, 14, 16)))
  testthat::expect_length(result, 1)
  testthat::expect_type(result, "character")
  testthat::expect_true(is.na(result))
})

testthat::test_that("WKT objects can be turned into data.frames of bounding boxes", {

  result <- wkt_bounding("POLYGON ((30 10, 40 40, 20 40, 10 20, 30 10))")
  testthat::expect_length(result, 4)
  testthat::expect_type(result, "list")
  testthat::expect_true(is.data.frame(result))
})

testthat::test_that("WKT objects can be turned into matrices of bounding boxes", {

  result <- wkt_bounding("POLYGON ((30 10, 40 40, 20 40, 10 20, 30 10))", TRUE)
  testthat::expect_length(result, 4)
  testthat::expect_type(result, "double")
  testthat::expect_true(is.matrix(result))
})

testthat::test_that("Invalid or NA WKT objects are handled in data.frames", {

  result <- wkt_bounding(c(NA_character_, "akfmsldgkmflkg"))
  testthat::expect_length(result, 4)
  testthat::expect_type(result, "list")
  testthat::expect_true(is.data.frame(result))
  testthat::expect_true(all(is.na(result)))
})

testthat::test_that("Invalid or NA WKT objects are handled in matrices", {

  result <- wkt_bounding(c(NA_character_, "akfmsldgkmflkg"), TRUE)
  testthat::expect_length(result, 8)
  testthat::expect_type(result, "double")
  testthat::expect_true(is.matrix(result))
  testthat::expect_true(all(is.na(result)))

})
