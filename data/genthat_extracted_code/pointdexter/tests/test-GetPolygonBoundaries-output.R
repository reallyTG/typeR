context("Validating GetPolyonBoundaries() output")

# load necessary data ----
data("city_boundary_spdf")
data("community_areas_spdf")

# perform tests ----
test_that("The output of GetPolygonBoundaries() will always have the same number of objects as the number of polygons in my.polygon", {
  expect_identical(length(list(GetPolygonBoundaries(my.polygon = city_boundary_spdf)))
                   , nrow(city_boundary_spdf))
  expect_identical(length(GetPolygonBoundaries(my.polygon = community_areas_spdf))
                   , nrow(community_areas_spdf))
})

test_that("my.polygon with only one polygon returns an object of class matrix", {
  expect_is(GetPolygonBoundaries(my.polygon = city_boundary_spdf)
                  , "matrix")
})

test_that("my.polygon with only one polygon will not be named", {
  expect_named(GetPolygonBoundaries(my.polygon = city_boundary_spdf)
               , NULL)
  expect_named(GetPolygonBoundaries(my.polygon = city_boundary_spdf
                                         , labels = "Chicago")
               , NULL)
})

test_that("my.polygon with only multiple polygons returns an object of class list", {
  expect_is(GetPolygonBoundaries(my.polygon = community_areas_spdf)
            , "list")
})

test_that("my.polygon with multiple polygons and no label will not be named", {
  expect_named(GetPolygonBoundaries(my.polygon = community_areas_spdf)
               , NULL)
})

test_that("my.polygon with multiply polygons and labels will be named", {
  expect_named(GetPolygonBoundaries(my.polygon = community_areas_spdf
                                                  , labels = community_areas_spdf$community))
  expect_named(GetPolygonBoundaries(my.polygon = community_areas_spdf
                                    , labels = community_areas_spdf$community)
               , community_areas_spdf$community)
})

# clean the global environment ----
rm(list = ls())
