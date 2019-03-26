context("Validating LabelPointsWithinPolygons() output")

# load necessary data ----
data("cps_sy1819")
data("city_boundary_spdf")
data("community_areas_spdf")

# create polygon boundaries ----
boundary <-
  GetPolygonBoundaries(my.polygon = city_boundary_spdf)

community.area.boundaries <-
  GetPolygonBoundaries(my.polygon = community_areas_spdf
                       , labels = community_areas_spdf$community)

# perform tests ----
test_that("polygon.boundaries as a matrix returns a logical vector", {
  expect_is(LabelPointsWithinPolygons(lng = cps_sy1819$school_longitude
                                         , lat = cps_sy1819$school_latitude
                                         , polygon.boundaries = boundary)
            , "logical")
})

test_that("polygon.boundaries as a list returns a character vector", {
  expect_is(LabelPointsWithinPolygons(lng = cps_sy1819$school_longitude
                                      , lat = cps_sy1819$school_latitude
                                      , polygon.boundaries = community.area.boundaries)
            , "character")
})

# clean the global environment ----
rm(list = ls())
