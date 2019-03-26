context("physics")

test_that("c to k", {
  expect_equal(temp_c_to_k(0), 273.15)
})

test_that("saturation vapor pressure", {
  expect_equal(svp_sea_level(temp_k = temp_c_to_k(37)), 47, tolerance = 0.1)
})
