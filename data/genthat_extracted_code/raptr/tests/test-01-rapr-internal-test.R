context("01-internal-tests")
source("functions.R")

test_that("space calculations (unreliable)", {
  ## create artificial space that is a kmeans problem
  # subset data
  data(sim_ru)
  sim_rd <- spp.subset(sim_ru, 3) %>% pu.subset(1:3) %>% slot("data")
  sim_rd@attribute.spaces[[1]]@spaces[[1]]@demand.points@weights <- rep(1, 5)
  # run initial k-means using r-builtin
  km <- kmeans(sim_rd@attribute.spaces[[1]]@spaces[[1]]@demand.points@coords,
               centers = 3)
  # update planning units
  sim_rd@attribute.spaces[[1]]@spaces[[1]]@planning.unit.points@coords <-
    km$centers
  # calculate metrics
  metrics <- calcUnreliableMetrics(sim_rd, 1, 1, solution = seq_len(3))
  ## tests
  # compare totss
  expect_equal(km$totss, metrics$tss)
  # compare withinss
  expect_equal(km$tot.withinss, metrics$spaceheld)
  # compare proportions
  expect_equal((km$betweenss / km$totss), metrics$prop)
})

test_that("space calculations (reliable: 0%)", {
  ## create artificial space that has the planning units as the centroids
  # data
  data(sim_ru)
  sim_rd <- spp.subset(sim_ru, 3L) %>% pu.subset(1L) %>% slot("data")
  sim_rd@pu.species.probabilities$value <- 1
  sim_rd@attribute.spaces[[1]]@spaces[[1]]@planning.unit.points@coords <-
    matrix(colMeans(
      sim_rd@attribute.spaces[[1]]@spaces[[1]]@demand.points@coords),
      ncol = 2)
  sim_rd@attribute.spaces[[1]]@spaces[[1]]@demand.points@weights <-
    rep(1, nrow(sim_rd@attribute.spaces[[1]]@spaces[[1]]@demand.points@coords))
  # calculate metrics
  metrics <- calcReliableMetrics(sim_rd, 1, 1, RapReliableOpts(), solution = 1)
  ## tests
  # compare proportions
  expect_equal(0, metrics$prop)
})

test_that("space calculations (reliable: 100%)", {
  ## create artificial space that has the planning units and the
  # data
  data(sim_ru)
  sim_rd <- spp.subset(sim_ru, 3) %>% slot("data")
  sim_rd@pu.species.probabilities$value <- 1
  sim_rd@attribute.spaces[[1]]@spaces[[1]]@planning.unit.points@coords <-
    sim_rd@attribute.spaces[[1]]@spaces[[1]]@demand.points@coords
  sim_rd@attribute.spaces[[1]]@spaces[[1]]@demand.points@weights <-
    rep(1, nrow(sim_rd@attribute.spaces[[1]]@spaces[[1]]@demand.points@coords))
  # calculate metrics
  metrics <- calcReliableMetrics(sim_rd, 1, 1, RapReliableOpts(),
                                seq_len(100))
  ## tests
  # compare proportions
  expect_equal(1, metrics$prop)
})

test_that("rcpp_sum_duplicates", {
  # create data
  imat <- matrix(c(1, 1, 6,
                   1, 2, 4,
                   2, 1, 2,
                   2, 2, 5,
                   1, 1, 7,
                   2, 2, 1), byrow = TRUE, ncol = 3)
  omat1 <- matrix(c(1, 1, 13,
                    1, 2, 4,
                    2, 1, 2,
                    2, 2, 6), byrow = TRUE, ncol = 3)
  omat2 <- as.matrix(rcpp_sum_duplicates(as.integer(imat[, 1]),
                                         as.integer(imat[, 2]), imat[, 3]))
  omat2 <- omat2[order(paste0(omat2[, 1], "_", omat2[, 2])), ]
  # run tests
  expect_equal(omat1[, 1], omat2[, 1])
  expect_equal(omat1[, 2], omat2[, 2])
  expect_equal(omat1[, 3], omat2[, 3])
})

test_that("demand.points.density1d", {
  # make points
  pts <- matrix(rnorm(100), ncol = 1)
  # make demand points
  dp <- raptr:::demand.points.density1d(pts, 1000)
  # check properties of demand points
  expect_true(ncol(dp$coords) == 1)
  expect_true(nrow(dp$coords) == 1000)
  expect_is(dp$coords, "matrix")
  expect_is(dp$weights, "numeric")
})

test_that("demand.points.density2d", {
  # make points
  pts <- matrix(rnorm(100), ncol = 2)
  # make demand points
  dp <- raptr:::demand.points.density2d(pts, 1000)
  # check properties of demand points
  expect_true(ncol(dp$coords) == 2)
  expect_true(nrow(dp$coords) == 1000)
  expect_is(dp$coords, "matrix")
  expect_is(dp$weights, "numeric")
})

test_that("demand.points.hypervolume", {
  # skip on cran due to issues in hypervolume's progress bars
  skip_on_cran()
  # make points
  pts <- matrix(rnorm(999), ncol = 3)
  # make demand points
  dp <- raptr:::demand.points.hypervolume(pts, 10, quantile = 0.95,
                                          samples.per.point = 10)
  # check properties of demand points
  expect_true(ncol(dp$coords) == 3)
  expect_true(nrow(dp$coords) == 10)
  expect_is(dp$coords, "matrix")
  expect_is(dp$weights, "numeric")
})

test_that("spacePlot.1d", {
  # make plot
  spacePlot.1d(pu = data.frame(X1 = rnorm(100),
                               status = c(rep("Not Selected", 97), "Selected",
                                          "Locked In", "Locked Out")),
               dp = data.frame(X1 = runif(100, min = -4, max = 4),
               weights = runif(100)),
               pu.color.palette = c("grey30", "green", "black", "red"),
               main = "test 1d")
  expect_true(TRUE)
})

test_that("spacePlot.2d", {
  # make plot
  spacePlot.2d(pu = data.frame(X1 = rnorm(100), X2 = rnorm(100),
                               status = c(rep("Not Selected", 97), "Selected",
                                          "Locked In", "Locked Out")),
               dp = data.frame(X1 = runif(100, min = -4, max = 4),
                               X2 = runif(100, min = -4, max = 4),
               weights = runif(100)),
               pu.color.palette = c("grey30", "green", "black", "red"),
               main = "test 2d")
  expect_true(TRUE)
})

test_that("spacePlot.3d", {
  # skip on cran and travis
  skip_on_cran()
  skip_on_travis()
  # make plot
  spacePlot.3d(pu = data.frame(X1 = rnorm(100), X2 = rnorm(100),
                               X3 = rnorm(100),
                               status = c(rep("Not Selected", 97),
                                          "Selected", "Locked In",
                                          "Locked Out")),
              dp = data.frame(X1 = runif(100, min = -4, max = 4),
                              X2 = runif(100, min = -4, max = 4),
                              X3 = runif(100, min = -4, max = 4),
                              weights = runif(100)),
              pu.color.palette = c("grey30", "green", "black", "red"),
              main = "test 3d")
  # close rgl device
  rgl::rgl.close()
  expect_true(TRUE)
})

test_that("ZonalMean functions", {
  purast <- raster::disaggregate(
              raster::raster(matrix(2:10, ncol = 3)),
              fact = 100)
  species <- purast * abs(rnorm(ncell(purast)))
  z1 <- raster::zonal(species, purast, fun = "mean")
  z2 <- raptr:::zonalMean(purast, species[[1]])
  z3 <- raptr:::zonalMean(purast, species[[1]], ncores = 2)
  expect_equal(round(z1[, 2], 10), round(z2[[3]], 10))
  expect_equal(round(z1[, 2], 10), round(z3[[3]], 10))
})

test_that("calcSpeciesAverageInPus functions", {
  template_raw <- raster::raster(matrix(2:10, ncol = 3), xmn = 0, xmx = 1,
                                 ymn = 0, ymx = 1,
                                 crs = sp::CRS(paste("+proj=merc +lon_0=0",
                                                     "+k=1 +x_0=0 +y_0=0",
                                                     "+ellps=WGS84",
                                                     "+datum=WGS84 +units=m",
                                                     "+no_defs")))
  template <- raster::disaggregate(template_raw, fact = 5)
  polys <- raster::rasterToPolygons(template_raw, n = 4)
  polys <- polys[order(polys@data$layer), ]
  species <- raster::setValues(template, round(runif(ncell(template))))
  p1 <- raster::zonal(species, template, "mean")
  p2 <- calcSpeciesAverageInPus(polys, species, field = "layer")
  p3 <- calcSpeciesAverageInPus(polys, species, ncores = 2, field = "layer")
  expect_equal(round(p1[, 2], 10), round(p2[[3]], 10))
  expect_equal(round(p1[, 2], 10), round(p3[[3]], 10))
})

test_that("PolySet conversion function", {
  template <- raster::raster(matrix(1:9, ncol = 3), xmn = 0, xmx = 1, ymn = 0,
                             ymx = 1,
                             crs = sp::CRS(paste("+proj=merc +lon_0=0 +k=1",
                                                 "+x_0=0 +y_0=0 +ellps=WGS84",
                                                 "+datum=WGS84 +units=m",
                                                 "+no_defs")))
  polys <- raster::rasterToPolygons(template, n = 4)
  pdf1 <- raptr:::rcpp_Polygons2PolySet(polys@polygons)
  pdf2 <- structure(list(
    PID = c(1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 3L, 3L, 3L, 3L, 3L, 4L, 4L,
            4L, 4L, 4L, 5L, 5L, 5L, 5L, 5L, 6L, 6L, 6L, 6L, 6L, 7L, 7L,
            7L, 7L, 7L, 8L, 8L, 8L, 8L, 8L, 9L, 9L, 9L, 9L, 9L),
    SID = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,
            1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,
                 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L),
    POS = c(1L, 2L, 3L, 4L, 5L, 1L, 2L, 3L, 4L, 5L, 1L, 2L, 3L, 4L, 5L, 1L, 2L,
            3L, 4L, 5L, 1L, 2L, 3L, 4L, 5L, 1L, 2L, 3L, 4L, 5L, 1L, 2L,
            3L, 4L, 5L, 1L, 2L, 3L, 4L, 5L, 1L, 2L, 3L, 4L, 5L),
    X = c(0, 0.333333333333, 0.333333333333, 0, 0, 0.333333333333,
          0.666666666667, 0.666666666667, 0.333333333333, 0.333333333333,
          0.666666666667, 1, 1, 0.666666666667,  0.666666666667, 0,
          0.333333333333, 0.333333333333, 0, 0, 0.333333333333,
          0.666666666667, 0.666666666667, 0.333333333333, 0.333333333333,
          0.666666666667, 1, 1, 0.666666666667, 0.666666666667, 0,
          0.333333333333, 0.333333333333, 0, 0, 0.333333333333,
          0.666666666667, 0.666666666667, 0.333333333333,
          0.333333333333, 0.666666666667, 1, 1,  0.666666666667,
          0.666666666667),
    Y = c(1, 1, 0.666666666667, 0.666666666667, 1, 1, 1, 0.666666666667,
          0.666666666667, 1, 1, 1, 0.666666666667, 0.666666666667, 1,
          0.666666666667, 0.666666666667, 0.333333333333, 0.333333333333,
          0.666666666667, 0.666666666667, 0.666666666667, 0.333333333333,
          0.333333333333, 0.666666666667, 0.666666666667, 0.666666666667,
          0.333333333333, 0.333333333333, 0.666666666667, 0.333333333333,
          0.333333333333, 0, 0, 0.333333333333, 0.333333333333, 0.333333333333,
          0, 0, 0.333333333333, 0.333333333333, 0.333333333333, 0, 0,
          0.333333333333)),
    .Names = c("PID", "SID", "POS", "X", "Y"),  row.names = c(NA, -45L),
    class = c("PolySet", "data.frame"), projection = "1")
  expect_is(pdf1, "PolySet")
  expect_true(max(pdf1[[1]] - pdf2[[1]]) < 1e-5)
  expect_true(max(pdf1[[2]] - pdf2[[2]]) < 1e-5)
  expect_true(max(pdf1[[3]] - pdf2[[3]]) < 1e-5)
  expect_true(max(pdf1[[4]] - pdf2[[4]]) < 1e-5)
  expect_true(max(pdf1[[5]] - pdf2[[5]]) < 1e-5)
})

test_that("boundary length data functions", {
  # generate polygons
  polys <- raster::rasterToPolygons(
    raster::raster(matrix(1:9, ncol = 3), xmn = 0, xmx = 3, ymn = 0, ymx = 3,
                   crs = sp::CRS(paste("+proj=merc +lon_0=0 +k=1 +x_0=0",
                                       "+y_0=0 +ellps=WGS84 +datum=WGS84",
                                       "+units=m +no_defs"))),
    n = 4)
  # make boundary length files
  bldf1 <- calcBoundaryData(polys)
  bldf2 <- structure(list(id1 = c(1L, 2L, 2L, 3L, 3L, 4L, 4L, 5L, 5L, 6L,
    6L, 6L, 7L, 7L, 8L, 8L, 8L, 9L, 9L, 9L), id2 = c(1L, 1L, 2L,
    2L, 3L, 1L, 4L, 2L, 4L, 3L, 5L, 6L, 4L, 7L, 5L, 7L, 8L, 6L, 8L,
    9L), boundary = c(2, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1,
    1, 1, 1, 1, 2)), .Names = c("id1", "id2", "boundary"), row.names = c(NA,
    -20L), class = "data.frame")
  # convert to integer for floating point comparisons
  bldf2[[2]] <- as.integer(bldf2[[2]])
  # sort by ids
  bldf1$ids <- apply(as.matrix(bldf1[, 1:2, drop = FALSE]), 1,
                     function(x) return(paste(sort(x), collapse = "_")))
  bldf2$ids <- apply(as.matrix(bldf2[, 1:2, drop = FALSE]), 1,
                    function(x) return(paste(sort(x), collapse = "_")))
  bldf1 <- bldf1[order(bldf1$ids), ]
  bldf2 <- bldf2[order(bldf2$ids), ]
  # check that values are correct
  expect_equal(bldf1$ids, bldf2$ids)
  expect_equal(bldf1[[3]], bldf2[[3]])
})


test_that("urap.squared.distance", {
  # make test data
  data(iris)
  test1.MTX <- as.matrix(iris[1:10, -5])
  test2.MTX <- as.matrix(iris[, -5])
  # generate distances
  d1 <- urap.squared.distance(test1.MTX, test2.MTX)
  d2 <- apply(test2.MTX, 1,
              function(x) min(as.matrix(dist(rbind(matrix(x, nrow = 1),
                                                   test1.MTX)))[-1, 1])) ^ 2
  # compare them
  expect_equal(d1, d2)
  expect_length(d1, nrow(test2.MTX))
})
