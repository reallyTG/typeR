context("coords_points")

test_that("multiplication works", {
  coords_points(ice_coords) %>% expect_s4_class("SpatialPoints") 
})
