context("multivariate")

test_that("correctly calculates multivariate", {
  set.seed(123)
  data <- segments_1to5_6to10_11to15(1000)

  points <- r_multivariate(data)
  expect_equal(points, -4121.265, tolerance = 0.1)

  points <- multivariate(data)
  expect_equal(points, -4121.265, tolerance = 0.1)
})
