context("Scaling")

test_that("Testing scale_uniform", {
  # generate some random data
  num_samples <- 40
  num_dims <- 10
  data <- matrix(runif(num_samples * num_dims), nrow = num_samples,
                 dimnames = list(paste0("Sample", seq_len(num_samples)), paste0("Dim", seq_len(num_dims))))

  data_sc <- scale_uniform(data, center = 0, max_range = 1)
  ranges <- apply(data_sc, 2, range)

  expect_is( data_sc, "matrix" )
  expect_equal( nrow(data_sc), nrow(data) )
  expect_equal( ncol(data_sc), ncol(data) )
  expect_equal(max(ranges[2,] - ranges[1,]), 1)
  expect_equal((ranges[1,] + ranges[2,]) / 2, setNames(rep(0, num_dims), colnames(data)))
  expect_equal(dimnames(data_sc), dimnames(data))

  # reapply
  data_sc2 <- apply_uniform_scale(data, attr(data_sc, "addend"), attr(data_sc, "multiplier"))
  expect_equal(data_sc, data_sc2)

  # try with a different center and max_range
  data_sc <- scale_uniform(data, center = 10, max_range = 1000)
  ranges <- apply(data_sc, 2, range)

  expect_is( data_sc, "matrix" )
  expect_equal( nrow(data_sc), nrow(data) )
  expect_equal( ncol(data_sc), ncol(data) )
  expect_equal(max(ranges[2,] - ranges[1,]), 1000)
  expect_equal(colMeans(ranges), setNames(rep(10, num_dims), colnames(data)))
})

test_that("Testing scale_uniform with edge case", {
  # generate some random data
  num_samples <- 1
  num_dims <- 10
  data <- matrix(runif(num_samples * num_dims), nrow = num_samples,
                 dimnames = list(paste0("Sample", seq_len(num_samples)), paste0("Dim", seq_len(num_dims))))


  data_sc <- scale_uniform(data, center = 0, max_range = 1)
  ranges <- apply(data_sc, 2, range)

  expect_is( data_sc, "matrix" )
  expect_equal( nrow(data_sc), nrow(data) )
  expect_equal( ncol(data_sc), ncol(data) )
  expect_equal(max(ranges[2,] - ranges[1,]), 0) # 0 because only 1 sample
  expect_equal(colMeans(ranges), setNames(rep(0, num_dims), colnames(data)))

  # reapply
  data_sc2 <- apply_uniform_scale(data, attr(data_sc, "addend"), attr(data_sc, "multiplier"))
  expect_equal(data_sc, data_sc2)

  # try with a different center and max_range
  data_sc <- scale_uniform(data, center = 10, max_range = 1000)
  ranges <- apply(data_sc, 2, range)

  expect_is( data_sc, "matrix" )
  expect_equal( nrow(data_sc), nrow(data) )
  expect_equal( ncol(data_sc), ncol(data) )
  expect_equal(max(ranges[2,] - ranges[1,]), 0) # 0 because only 1 sample
  expect_equal(colMeans(ranges), setNames(rep(10, num_dims), colnames(data)))
})

test_that("Testing scale_uniform with another edge case", {
  # generate some random data
  num_samples <- 10
  num_dims <- 1
  data <- matrix(runif(num_samples * num_dims), nrow = num_samples)

  data_sc <- scale_uniform(data, center = 0, max_range = 1)
  ranges <- apply(data_sc, 2, range)

  expect_is( data_sc, "matrix" )
  expect_equal( nrow(data_sc), nrow(data) )
  expect_equal( ncol(data_sc), ncol(data) )
  expect_equal(max(ranges[2,] - ranges[1,]), 1)
  expect_equal(colMeans(ranges), rep(0, num_dims))

  # reapply
  data_sc2 <- apply_uniform_scale(data, attr(data_sc, "addend"), attr(data_sc, "multiplier"))
  expect_equal(data_sc, data_sc2)

  # try with a different center and max_range
  data_sc <- scale_uniform(data, center = 10, max_range = 1000)
  ranges <- apply(data_sc, 2, range)

  expect_is( data_sc, "matrix" )
  expect_equal( nrow(data_sc), nrow(data) )
  expect_equal( ncol(data_sc), ncol(data) )
  expect_equal(max(ranges[2,] - ranges[1,]), 1000)
  expect_equal(colMeans(ranges), rep(10, num_dims))
})

test_that("Testing scale_uniform with vector", {
  # generate some random data
  num_samples <- 10
  data <- runif(num_samples)

  data_sc <- scale_uniform(data, center = 0, max_range = 1)
  ranges <- range(data_sc)

  expect_is( data_sc, "numeric" )
  expect_equal( length(data_sc), length(data) )
  expect_equal(max(ranges[[2]] - ranges[[1]]), 1)
  expect_equal(mean(ranges), 0)

  # reapply
  data_sc2 <- apply_uniform_scale(data, attr(data_sc, "addend"), attr(data_sc, "multiplier"))
  expect_equal(data_sc, data_sc2)

  # try with a different center and max_range
  data_sc <- scale_uniform(data, center = 10, max_range = 1000)
  ranges <- range(data_sc)

  expect_is( data_sc, "numeric" )
  expect_equal( length(data_sc), length(data) )
  expect_equal(max(ranges[[2]] - ranges[[1]]), 1000)
  expect_equal(mean(ranges), 10)
})






test_that("Testing scale_quantile", {
  # generate some random data
  num_samples <- 40
  num_dims <- 10
  data <- matrix(runif(num_samples * num_dims), nrow = num_samples,
                 dimnames = list(paste0("Sample", seq_len(num_samples)), paste0("Dim", seq_len(num_dims))))

  data_sc <- scale_quantile(data, outlier_cutoff = 0.05)
  ranges <- apply(data_sc, 2, range)

  expect_is( data_sc, "matrix" )
  expect_equal( nrow(data_sc), nrow(data) )
  expect_equal( ncol(data_sc), ncol(data) )
  expect_equal( ranges, matrix(rep(c(0, 1), num_dims), ncol = num_dims, dimnames = list(NULL, colnames(data))) )
  expect_equal(dimnames(data_sc), dimnames(data))

  # reapply
  data_sc2 <- apply_quantile_scale(data, attr(data_sc, "addend"), attr(data_sc, "multiplier"))
  expect_equal(data_sc, data_sc2)

  # try with a different center and max_range
  data_sc <- scale_quantile(data, outlier_cutoff = 0)
  ranges <- apply(data_sc, 2, range)

  expect_is( data_sc, "matrix" )
  expect_equal( nrow(data_sc), nrow(data) )
  expect_equal( ncol(data_sc), ncol(data) )
  expect_equal( ranges, matrix(rep(c(0, 1), num_dims), ncol = num_dims, dimnames = list(NULL, colnames(data))) )

  data_sc2 <- scale_minmax(data)
  expect_equal(data_sc, data_sc2)
})

test_that("Testing scale_quantile with edge case", {
  # generate some random data
  num_samples <- 1
  num_dims <- 10
  data <- matrix(runif(num_samples * num_dims), nrow = num_samples)

  data_sc <- scale_quantile(data, outlier_cutoff = 0.05)
  ranges <- apply(data_sc, 2, range)

  expect_is( data_sc, "matrix" )
  expect_equal( nrow(data_sc), nrow(data) )
  expect_equal( ncol(data_sc), ncol(data) )
  expect_equal( ranges, matrix(rep(c(0, 0), num_dims), ncol = num_dims) )

  # reapply
  data_sc2 <- apply_quantile_scale(data, attr(data_sc, "addend"), attr(data_sc, "multiplier"))
  expect_equal(data_sc, data_sc2)

  # try with a different center and max_range
  data_sc <- scale_quantile(data, outlier_cutoff = 0)
  ranges <- apply(data_sc, 2, range)

  expect_is( data_sc, "matrix" )
  expect_equal( nrow(data_sc), nrow(data) )
  expect_equal( ncol(data_sc), ncol(data) )
  expect_equal( ranges, matrix(rep(c(0, 0), num_dims), ncol = num_dims) )

  data_sc2 <- scale_minmax(data)
  expect_equal(data_sc, data_sc2)
})

test_that("Testing scale_quantile with another edge case", {
  # generate some random data
  num_samples <- 40
  num_dims <- 1
  data <- matrix(runif(num_samples * num_dims), nrow = num_samples)

  data_sc <- scale_quantile(data, outlier_cutoff = 0.05)
  ranges <- apply(data_sc, 2, range)

  expect_is( data_sc, "matrix" )
  expect_equal( nrow(data_sc), nrow(data) )
  expect_equal( ncol(data_sc), ncol(data) )
  expect_equal( ranges, matrix(rep(c(0, 1), num_dims), ncol = num_dims) )

  # reapply
  data_sc2 <- apply_quantile_scale(data, attr(data_sc, "addend"), attr(data_sc, "multiplier"))
  expect_equal(data_sc, data_sc2)

  # try with a different center and max_range
  data_sc <- scale_quantile(data, outlier_cutoff = 0)
  ranges <- apply(data_sc, 2, range)

  expect_is( data_sc, "matrix" )
  expect_equal( nrow(data_sc), nrow(data) )
  expect_equal( ncol(data_sc), ncol(data) )
  expect_equal( ranges, matrix(rep(c(0, 1), num_dims), ncol = num_dims) )

  data_sc2 <- scale_minmax(data)
  expect_equal(data_sc, data_sc2)
})


test_that("Testing scale_quantile with a vector", {
  # generate some random data
  num_samples <- 40
  data <- runif(num_samples)

  data_sc <- scale_quantile(data, outlier_cutoff = 0.05)
  ranges <- range(data_sc)

  expect_is( data_sc, "numeric" )
  expect_equal( length(data_sc), length(data) )
  expect_equal( ranges, c(0, 1) )

  # reapply
  data_sc2 <- apply_quantile_scale(data, attr(data_sc, "addend"), attr(data_sc, "multiplier"))
  expect_equal(data_sc, data_sc2)

  # try with a different center and max_range
  data_sc <- scale_quantile(data, outlier_cutoff = 0)
  ranges <- range(data_sc)

  expect_is( data_sc, "numeric" )
  expect_equal( length(data_sc), length(data) )
  expect_equal( ranges, c(0, 1) )

  data_sc2 <- scale_minmax(data)
  expect_equal(data_sc, data_sc2)
})

