context("romsboundary")

test_that("boundary works", {
  romsboundary(ice_coords) %>% expect_s4_class("SpatialPolygons")
})
