context("02-misc")

test_that("gdal installation checks", {
  skip_on_cran()
  skip_on_appveyor()
  expect_equal(is.gdalInstalled(),
               requireNamespace("rgdal", quietly = TRUE))
})

test_that("Gurobi installation checks", {
  expect_equal(is.GurobiInstalled(FALSE),
               requireNamespace("gurobi", quietly = TRUE))
})

test_that("blank.raster function", {
  #  generate planning units
  rst <- blank.raster(sim.pus(n = 225L), 1)
  # check simulated dataset
  expect_true(inherits(rst, "RasterLayer"))
  expect_equal(ncell(rst), 225L)
  expect_equal(xmin(rst), -7.5)
  expect_equal(ymin(rst), -7.5)
  expect_equal(xmax(rst), 7.5)
  expect_equal(xmax(rst), 7.5)
  expect_equal(sum(is.na(rst[])), 0)
})

test_that("randomPoints function", {
  sim_spp <- sim.species(sim.pus(225L), model = "normal", res = 1)
  pts <- randomPoints(sim_spp, 10)
  expect_equal(ncol(pts), 2)
  expect_equal(nrow(pts), 10)
  expect_equal(sum(is.na(c(pts))), 0)
})

test_that("urap.proportion.held", {
  km <- kmeans(iris[1:5, -5], centers = 3)
  prop <- urap.proportion.held(km$centers, as.matrix(iris[1:5, -5]))
  ## tests
  # compare proportions
  expect_equal(km$betweenss / km$totss, prop)
})

test_that("rrap.proportion.held", {
  data(sim_ru)
  sim_rd <- sim_ru %>%
            spp.subset(3L) %>%
            pu.subset(1:5) %>%
            dp.subset(1, 1, 10:11) %>%
            slot("data")
  # rrap.proportion.held
  prop1 <- rrap.proportion.held(
    sim_rd@attribute.spaces[[1]]@spaces[[1]]@planning.unit.points@coords,
    sim_rd@pu.species.probabilities$value,
    sim_rd@attribute.spaces[[1]]@spaces[[1]]@demand.points@coords,
    sim_rd@attribute.spaces[[1]]@spaces[[1]]@demand.points@weights,
    0, 3L)
  # calcReliableMetrics
  prop2 <- calcReliableMetrics(sim_rd, 1, 1,
                               RapReliableOpts(failure.multiplier = 0,
                                               max.r.level = 3L))$prop
  # compare proportions
  expect_equal(prop1, prop2)
})
