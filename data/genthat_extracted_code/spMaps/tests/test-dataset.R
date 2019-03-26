#Copyright © 2016 RTE Réseau de transport d’électricité
context("Get dataset")

test_that("getEuropeReferenceTable", {
  data <- getEuropeReferenceTable()
  expect_is(data, "data.frame")
})

test_that("getEuropeCountries", {
  data <- getEuropeCountries()
  expect_is(data, "SpatialPolygonsDataFrame")
})

test_that("getEuropeStates", {
  data <- getEuropeStates()
  expect_is(data, "SpatialPolygonsDataFrame")
})
