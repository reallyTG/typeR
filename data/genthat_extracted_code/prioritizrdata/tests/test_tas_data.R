context("tas data") 

test_that("tas_pu", {
  expect_is(tas_pu, "SpatialPolygonsDataFrame")
  expect_true(rgeos::gIsValid(tas_pu))
})

test_that("tas_features", {
  expect_is(tas_features, "RasterStack")
})
