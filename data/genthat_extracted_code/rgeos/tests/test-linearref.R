library("testthat")
library("rgeos")
library("sp")


context("Linear Referencing")

coord <- function(x) unname(coordinates(x))


test_that("zero-length input arguments fail with error", {

  dat <- data.frame(x = 1)
  p <- SpatialPointsDataFrame(readWKT("POINT(0 0)"), dat)
  l <- SpatialLinesDataFrame(readWKT("LINESTRING (-1 0, 1 0)"), dat)

  expect_error(gProject(l, subset(p, x > 1)))
  expect_error(gProject(subset(l, x > 1), p, normalized = TRUE))

  expect_error(gInterpolate(l, numeric(0)))
  expect_error(gInterpolate(subset(l, x > 1), d = 0.5, normalized = TRUE))

})


test_that("interpolation works with zero length line", {

  l <- readWKT("LINESTRING (10 0, 10 0)")
  expect_identical(coord(gInterpolate(readWKT("LINESTRING (10 0, 10 0)"),
                                      d = 0.5)),
                   coord(head(as(l, "SpatialPoints"), 1)))
})


test_that("repeated coordinates work", {

  l <- readWKT("LINESTRING (10 0, 10 0, 20 0)")
  p <- readWKT("POINT(11 0)")

  d <- gProject(l, p, normalized = TRUE)
  expect_identical(gInterpolate(l, d, normalized = TRUE), p)

  d <- gProject(l, p, normalized = FALSE)
  expect_identical(gInterpolate(l, d, normalized = FALSE), p)
})


test_that("functions work with MultiLineStrings", {

  # https://trac.osgeo.org/geos/ticket/323
  l <- readWKT("MULTILINESTRING ((0 -2, 0 2), (-2 0, 2 0))")
  p <- readWKT("MULTIPOINT(2 1.9, 2 2.1)")
  res <- readWKT("MULTIPOINT(2 0, 0 2)")

  expect_identical(coord(gInterpolate(l, gProject(l, p))), coord(res))
})


test_that("normalization works in gInterpolate", {

  l <- readWKT("LINESTRING(25 50, 100 125, 150 190)")

  expect_equal(gInterpolate(l, 0.5*gLength(l), normalized = FALSE),
               gInterpolate(l, 0.5, normalized = TRUE))
})


test_that("interpolation is correct at endpoints", {

  l <- readWKT("LINESTRING(25 50, 100 125, 150 190)")
  p <- as(l, "SpatialPoints")

  expect_identical(coord(gInterpolate(l, 0, TRUE)), coord(p[1, ]))
  expect_identical(coord(gInterpolate(l, 0, FALSE)), coord(p[1, ]))

  expect_identical(coord(gInterpolate(l, 1, TRUE)),
                   coord(p[length(p), ]))
  expect_identical(coord(gInterpolate(l, gLength(l), FALSE)),
                   coord(p[length(p), ]))
})
