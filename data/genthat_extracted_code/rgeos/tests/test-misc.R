library("testthat")
library("rgeos")
library("sp")


context("Misc - gNearestPoints")

coord <- function(x) unname(coordinates(x))


test_that("gNearestPoints works with different geometries as inputs", {

  g1 <- readWKT("POINT(0 0)")
  g2 <- readWKT("POINT(10 0)")
  expect_identical(coord(gNearestPoints(g1, g2)),
                   coord(readWKT("MULTIPOINT(0 0, 10 0)")))
  expect_identical(gDistance(g1, g2), 10)


  g1 <- readWKT("POINT(0 0)")
  g2 <- readWKT("MULTIPOINT(10 0, 50 30)")
  expect_identical(coord(gNearestPoints(g1, g2)),
                   coord(readWKT("MULTIPOINT(0 0, 10 0)")))
  expect_identical(gDistance(g1, g2), 10)


  g1 <- readWKT("POINT(3 0)")
  g2 <- readWKT("LINESTRING(0 10, 50 10, 100 50)")
  expect_identical(coord(gNearestPoints(g1, g2)),
                   coord(readWKT("MULTIPOINT(3 0, 3 10)")))
  expect_identical(gDistance(g1, g2), 10)


  g1 <- readWKT("POINT(3 0)")
  g2 <- readWKT("MULTILINESTRING((34 54, 60 34), (0 10, 50 10, 100 50))")
  expect_identical(coord(gNearestPoints(g1, g2)),
                   coord(readWKT("MULTIPOINT(3 0, 3 10)")))
  expect_identical(gDistance(g1, g2), 10)


  g1 <- readWKT("POINT(35 60)")
  g2 <- readWKT("POLYGON((34 54, 60 34, 60 54, 34 54),
                         (50 50, 52 50, 52 48, 50 48, 50 50))")
  expect_identical(coord(gNearestPoints(g1, g2)),
                   coord(readWKT("MULTIPOINT(35 60, 35 54)")))
  expect_identical(gDistance(g1, g2), 6)


  g1 <- readWKT("POINT(35 60)")
  g2 <- readWKT("MULTIPOLYGON(((34 54, 60 34, 60 54, 34 54),
                               (50 50, 52 50, 52 48, 50 48, 50 50)),
                              ((100 100, 150 100, 150 150, 100 150, 100 100),
                               (120 120, 120 130, 130 130, 130 120, 120 120))))")
  expect_identical(coord(gNearestPoints(g1, g2)),
                   coord(readWKT("MULTIPOINT(35 60, 35 54)")))
  expect_identical(gDistance(g1, g2), 6)


  g1 <- readWKT("MULTIPOINT(10 0, 50 30)")
  g2 <- readWKT("POINT(10 0)")
  expect_identical(coord(gNearestPoints(g1, g2)),
                   coord(readWKT("MULTIPOINT(10 0, 10 0)")))
  expect_identical(gDistance(g1, g2), 0)


  g1 <- readWKT("MULTIPOINT(10 0, 50 30)")
  g2 <- readWKT("MULTIPOINT(0 0, 150 30)")
  expect_identical(coord(gNearestPoints(g1, g2)),
                   coord(readWKT("MULTIPOINT(10 0, 0 0)")))
  expect_identical(gDistance(g1, g2), 10)


  g1 <- readWKT("MULTIPOINT(3 0, 200 30)")
  g2 <- readWKT("LINESTRING(0 10, 50 10, 100 50)")
  expect_identical(coord(gNearestPoints(g1, g2)),
                   coord(readWKT("MULTIPOINT(3 0, 3 10)")))
  expect_identical(gDistance(g1, g2), 10)


  g1 <- readWKT("MULTIPOINT(3 0, 200 30)")
  g2 <- readWKT("LINESTRING(0 10, 50 10, 100 50)")
  expect_identical(coord(gNearestPoints(g1, g2)),
                   coord(readWKT("MULTIPOINT(3 0, 3 10)")))
  expect_identical(gDistance(g1, g2), 10)


  g1 <- readWKT("MULTIPOINT(3 0, -50 30)")
  g2 <- readWKT("MULTILINESTRING((34 54, 60 34), (0 10, 50 10, 100 50))")
  expect_identical(coord(gNearestPoints(g1, g2)),
                   coord(readWKT("MULTIPOINT(3 0, 3 10)")))
  expect_identical(gDistance(g1, g2), 10)


  # empty geometry
  dat <- data.frame(x = 1)
  g1 <- SpatialPointsDataFrame(rgeos::readWKT("POINT(0 0)"), dat)
  g2 <- SpatialLinesDataFrame(readWKT("LINESTRING (-1 0, 1 0)"), dat)
  expect_null(gNearestPoints(subset(g1, x > 1), g2))
})
