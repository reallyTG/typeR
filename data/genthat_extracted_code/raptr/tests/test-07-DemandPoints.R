context("07-DemandPoints")

test_that("DemandPoints generator function", {
  # create object
  dp <- DemandPoints(matrix(runif(100), ncol = 2), runif(50))
  # check object
  expect_is(dp, "DemandPoints")
  expect_equal(ncol(dp@coords), 2)
  expect_equal(nrow(dp@coords), 50)
  expect_equal(length(dp@weights), 50)
})

test_that("DemandPoints generator function (single point)", {
  # create object
  dp <- DemandPoints(matrix(1, ncol = 2, nrow = 1), 1)
  # check object
  expect_is(dp, "DemandPoints")
  expect_equal(ncol(dp@coords), 2)
  expect_equal(nrow(dp@coords), 1)
  expect_equal(length(dp@weights), 1)
})

test_that("demand.points (ks, geographic space)", {
  # load data
  sim_spp <- sim.species(sim.pus(225L), model = "normal", res = 1)
  # generate points
  pts <- randomPoints(sim_spp, n = 10, prob = TRUE)
  # create demand points
  dp <- make.DemandPoints(points = pts, n = 100L, kernel.method = "ks")
  # check objects
  expect_is(dp, "DemandPoints")
  expect_equal(ncol(dp@coords), 2)
  expect_equal(nrow(dp@coords), 100)
  expect_equal(sum(is.na(dp@coords)), 0)
  expect_equal(length(dp@weights), 100)
  expect_equal(sum(is.na(dp@weights)), 0)
})

test_that("demand.points (ks, attribute space)", {
  # load data
  data(cs_spp, cs_space)
  # generate points
  pts <- sp::SpatialPoints(coords = randomPoints(cs_spp[[1]], n = 10,
                                                 prob = TRUE))
  space.pts <- raster::extract(cs_space[[1]], pts)
  # create demand points
  dp <- make.DemandPoints(points = space.pts, n = 100L, kernel.method = "ks")
  # check objects
  expect_is(dp, "DemandPoints")
  expect_equal(ncol(dp@coords), 1)
  expect_equal(nrow(dp@coords), 100)
  expect_equal(sum(is.na(dp@coords)), 0)
  expect_equal(length(dp@weights), 100)
  expect_equal(sum(is.na(dp@weights)), 0)
})

test_that("demand.points (hypervolume, geographic space)", {
  # skip on cran due to issues in hypervolume's progress bars
  skip_on_cran()
  # load data
  data(cs_spp)
  # generate points
  pts <- sp::SpatialPoints(coords = randomPoints(cs_spp[[1]], n = 100,
                                                 prob = TRUE))@coords
  # create demand points
  dp <- make.DemandPoints(points = pts, n = 100L,
                          kernel.method = "hypervolume",
                          verbose = FALSE)
  # check objects
  expect_is(dp, "DemandPoints")
  expect_equal(ncol(dp@coords), 2)
  expect_equal(nrow(dp@coords), 100)
  expect_equal(sum(is.na(dp@coords)), 0)
  expect_equal(length(dp@weights), 100)
  expect_equal(sum(is.na(dp@weights)), 0)
})

test_that("demand.points (hypervolume, attribute space)", {
  # skip on cran due to issues in hypervolume's progress bars
  skip_on_cran()
  # load data
  data(cs_spp, cs_space)
  # generate points
  pts <- sp::SpatialPoints(coords = randomPoints(cs_spp[[1]], n = 100,
                           prob = TRUE))@coords
  # create demand points
  dp <- make.DemandPoints(points = pts, n = 100L,
                          kernel.method = "hypervolume",
                          verbose = FALSE)
  # check objects
  expect_is(dp, "DemandPoints")
  expect_equal(ncol(dp@coords), 2)
  expect_equal(nrow(dp@coords), 100)
  expect_equal(sum(is.na(dp@coords)), 0)
  expect_equal(length(dp@weights), 100)
  expect_equal(sum(is.na(dp@weights)), 0)
})
