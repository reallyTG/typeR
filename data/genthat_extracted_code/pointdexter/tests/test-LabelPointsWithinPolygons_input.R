context("Validating LabelPointsWithinPolygons() input")

# load necessary data ----
data("cps_sy1819")
data("city_boundary_spdf")
data("community_areas_spdf")

# create polygon boundaries ----
boundary <-
  GetPolygonBoundaries(my.polygon = city_boundary_spdf)

community.area.boundaries.not.named <-
  GetPolygonBoundaries(my.polygon = community_areas_spdf)

# perform tests ----
test_that("lng and lat are numeric vectors", {
  expect_error(LabelPointsWithinPolygons(lng = as.character(cps_sy1819$school_longitude)
                                         , lat = cps_sy1819$school_latitude
                                         , polygon.boundaries = boundary))
  expect_error(LabelPointsWithinPolygons(lng = cps_sy1819$school_longitude
                                         , lat = as.character(cps_sy1819$school_latitude)
                                         , polygon.boundaries = boundary))
})

test_that("lng and lat are of equal length", {
  expect_error(LabelPointsWithinPolygons(lng = 1:7
                                         , lat = cps_sy1819$school_latitude
                                         , polygon.boundaries = boundary))
  expect_error(LabelPointsWithinPolygons(lng = cps_sy1819$school_longitude
                                         , lat = 1:7
                                         , polygon.boundaries = boundary))
})

test_that("lng and lat do not contain any NA values", {
  expect_error(LabelPointsWithinPolygons(lng = c(cps_sy1819$school_longitude, NA)
                                         , lat = cps_sy1819$school_latitude
                                         , polygon.boundaries = boundary))
  expect_error(LabelPointsWithinPolygons(lng = cps_sy1819$school_longitude
                                         , lat = c(cps_sy1819$school_latitude, NA)
                                         , polygon.boundaries = boundary))
})

test_that("polygon.boundaries must be either a matrix or a list of matrices", {
  expect_error(LabelPointsWithinPolygons(lng = 1:3
                                         , lat = 1:3
                                         , polygon.boundaries = community_areas_spdf))
  expect_error(LabelPointsWithinPolygons(lng = 1:3
                                         , lat = 1:3
                                         , polygon.boundaries = list(iris, letters)))
})

test_that("if polygon.boundaries is a list, ensure that each matrix is labeled", {
  expect_error(LabelPointsWithinPolygons(lng = cps_sy1819$school_longitude
                                         , lat = cps_sy1819$school_latitude
                                         , polygon.boundaries = community.area.boundaries.not.named))
})

# clean the global environment ----
rm(list = ls())
