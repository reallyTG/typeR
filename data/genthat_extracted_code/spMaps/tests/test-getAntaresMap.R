#Copyright © 2016 RTE Réseau de transport d’électricité
context("Build map")

test_that("Default map", {
  default_map <- getSpMaps()
  expect_is(default_map, "SpatialPolygonsDataFrame")
})

test_that("Subset and combine", {
  combine_map <- getSpMaps(countries = c("ITA", "ESP", "FRA"), states = "FRA")
  expect_is(combine_map, "SpatialPolygonsDataFrame")
  
  all_map <- getSpMaps(countries = "all", states = "all")
  expect_is(all_map, "SpatialPolygonsDataFrame")
  
  all_map_2 <- getSpMaps(countries = "all", states = NULL)
  expect_is(all_map, "SpatialPolygonsDataFrame")
  
  all_map_3 <- getSpMaps(countries = NULL, states = "all")
  expect_is(all_map, "SpatialPolygonsDataFrame")
  
  all_map_4 <- getSpMaps(countries = "all", states = "FRA")
  expect_is(all_map, "SpatialPolygonsDataFrame")
  
  all_map_5 <- getSpMaps(countries = "FRA", states = "all")
  expect_is(all_map, "SpatialPolygonsDataFrame")
  
  
})

test_that("NULL map", {
  null_map <- suppressMessages(getSpMaps(countries = NULL, states = NULL))
  expect_null(null_map)
})

test_that("Invalid countries and states", {
  expect_error(getSpMaps(countries = "invalid"))
  expect_error(getSpMaps(states = "invalid"))
})
