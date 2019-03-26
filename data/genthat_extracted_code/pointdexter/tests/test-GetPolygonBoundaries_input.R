context("Validating GetPolyonBoundaries() input")

# load necessary data ----
data("city_boundary_spdf")
data("community_areas_spdf")

# perform tests ----
test_that("my.polygon is either of class SpatialPolygonsDataFrame or sf", {
  expect_error(GetPolygonBoundaries(my.polygon = iris))
  expect_error(GetPolygonBoundaries(my.polygon = letters))
  expect_error(GetPolygonBoundaries(my.polygon = USPersonalExpenditure))
  expect_error(GetPolygonBoundaries(my.polygon = list(1, "1")))
})

test_that("labels is a character vector", {
  expect_error(GetPolygonBoundaries(my.polygon = community_areas_spdf
                                    , labels = 1:77))
})

test_that("labels is of equal length to my.polygons", {
  expect_error(GetPolygonBoundaries(my.polygon = community_areas_spdf
                                    , labels = letters))
  expect_length(names(GetPolygonBoundaries(my.polygon = community_areas_spdf
                                           , labels = community_areas_spdf$community))
                , nrow(community_areas_spdf))
})

test_that("despite label, a my.polygon of length 1 will not be named", {
  expect_message(GetPolygonBoundaries(my.polygon = city_boundary_spdf
                                      , labels = "Chicago"))
})

# clean the global environment ----
rm(list = ls())
