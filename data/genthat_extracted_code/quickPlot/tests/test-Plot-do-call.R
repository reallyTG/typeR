test_that("clickExtent works", {
  library(raster)
  ow <- setwd(tempdir())

  # make a SpatialPolygon
  coords1 <- structure(c(-123.98, -117.1, -80.2, -100, -123.98, 60.9, 67.73, 65.58, 51.79, 60.9),
                       .Dim = c(5L, 2L))
  Sr1 <- Polygon(coords1)
  Srs1 <- Polygons(list(Sr1), "s1")
  shpEcozone <- SpatialPolygons(list(Srs1), 1L)
  crs(shpEcozone) <- "+init=epsg:4326 +proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

  r <- raster(extent(0,10,0,10), res = 1, vals = 1:100)

  a <- do.call(Plot, list(shpEcozone = shpEcozone, new = TRUE, speedup = 3))
  b <- Plot(shpEcozone, new = TRUE, speedup = 3)
  expect_true(identical(a, b))

  a <- do.call(Plot, list(r = r, shpEcozone = shpEcozone, new = TRUE, speedup = 3))
  b <- Plot(shpEcozone, r, new = TRUE, speedup = 3)
  expect_true(identical(a, b))

  a <- do.call(Plot, list(r = r, shpEcozone, new = TRUE, speedup = 3))
  b <- Plot(shpEcozone, r, new = TRUE, speedup = 3)
  expect_true(identical(a, b))

  a <- do.call(Plot, list(r, shpEcozone, new = TRUE, speedup = 3))
  b <- Plot(shpEcozone, r, new = TRUE, speedup = 3)
  expect_true(identical(a, b))

  # doesn't use name in a named list -- r1 is called r
  clearPlot()
  a <- do.call(Plot, list(r1 = r, shpEcozone, new = TRUE, speedup = 3))
  r2 <- r
  r2[5] <- 100
  Plot(r2, addTo = "r", title = "")
  aa <- rePlot()
  expect_true(identical(names(aa@quickPlotGrobList$r), c("r", "r2")))
  expect_true(identical(names(aa@quickPlotGrobList), c("r", "shpEcozone")))
})
