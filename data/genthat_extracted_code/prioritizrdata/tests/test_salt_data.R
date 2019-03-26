context("salt data") 

test_that("salt_pu", {
  expect_is(salt_pu, "RasterLayer")
})

test_that("salt_features", {
  expect_is(salt_features, "RasterStack")
})
