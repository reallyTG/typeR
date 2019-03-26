library(optim.functions)
context("function sampling")

test_that("cartesian sampling generates the correct shape of samples", {
  expect_equal(dim(cartesian.sample(5, 4)), c(5**4, 4))
})

test_that("sampling a function works as expected", {
  sampled.func <- sample.func("spherical", 10, 5, "lh.sample")
  expect_equal(dim(sampled.func), c(10, 6))
})

test_that("sampling the spherical function uses the correct range", {
  sampled.func <- sample.func("spherical", 5, 3, "cartesian.sample")
  expect_true(min(sampled.func$x1) >= -5 && min(sampled.func$x1) < 0)
  expect_true(max(sampled.func$x1) <= 5  && max(sampled.func$x1) > 1)
})

test_that("map range correctly changes the value of a single number", {
  expect_equal(map.range(0.2, -5, 5, 0, 1), -3)
})
