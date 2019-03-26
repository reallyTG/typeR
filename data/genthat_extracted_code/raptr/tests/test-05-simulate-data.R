context("05-simulate-data")

test_that("simulate planning units functions", {
  # generate planning units
  pus <- sim.pus(n = 225L)
  # check simulated dataset
  expect_true(inherits(pus, "SpatialPolygonsDataFrame"))
  expect_equal(nrow(pus@data), 225L)
  expect_equal(xmin(pus), -7.5)
  expect_equal(ymin(pus), -7.5)
  expect_equal(xmax(pus), 7.5)
  expect_equal(xmax(pus), 7.5)
})

test_that("simulate space functions", {
  # generate planning units
  pus <- sim.pus(n = 225L)
  # generate spaces
  spaces <- sim.space(pus, res = 1, d = 5)
  # check simulated dataset
  expect_true(inherits(spaces, "RasterStack"))
  expect_equal(nlayers(spaces), 5)
  expect_equal(xmin(spaces), -7.5)
  expect_equal(ymin(spaces), -7.5)
  expect_equal(xmax(spaces), 7.5)
  expect_equal(ymax(spaces), 7.5)
  expect_equal(sum(is.na(spaces[[1]][])), 0)
})

test_that("simulate species functions", {
  # generate planning units
  pus <- sim.pus(n = 225L)
  # generate spaces
  species <- sim.species(pus, res = 1, n = 5)
  # check simulated dataset
  expect_true(inherits(species, "RasterStack"))
  expect_equal(nlayers(species), 5)
  expect_equal(xmin(species), -7.5)
  expect_equal(ymin(species), -7.5)
  expect_equal(xmax(species), 7.5)
  expect_equal(ymax(species), 7.5)
  expect_equal(sum(is.na(species[[1]][])), 0)
})
