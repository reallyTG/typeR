context("hybridalg")

global_threshold <- 10
set.seed(123)
data_1 <- segments_1to5_6to10_11to15(2000)
data_2 <- segments_1to10_11to15(5000)

test_that("correctly identify independent results", {
  results <- hybridalg(data_1, likelihood = function(X) multivariate(X) - (0.1 * 2^ncol(X)) * log(nrow(X)), threshold = global_threshold)
  expect_equal(results$segments, list(1:5, 6:10, 11:15))

  data <- segments_1to10_11to15(5000)
  results <- hybridalg(data_2, likelihood = function(X) multivariate(X) - (0.2 * 2^ncol(X)) * log(nrow(X)), threshold = global_threshold)
  expect_equal(results$segment, list(1:10, 11:15))
})

test_that("can be called using segment", {
  results <- segment(data_1, likelihood = function(X) multivariate(X) - (0.1 * 2^ncol(X)) * log(nrow(X)), threshold = global_threshold, algorithm = "hybrid")
  expect_equal(results$segments, list(1:5, 6:10, 11:15))

  results <- segment(data_2, likelihood = function(X) multivariate(X) - (0.2 * 2^ncol(X)) * log(nrow(X)), algorithm = "hybrid", threshold = global_threshold)
  expect_equal(results$segments, list(1:10, 11:15))
})

test_that("works with cluster", {
  doParallel::registerDoParallel(1)
  results <- hybridalg(data_1, likelihood = function(X) multivariate(X) - (0.1 * 2^ncol(X)) * log(nrow(X)), allow_parallel = TRUE, threshold = global_threshold)
  expect_equal(results$segments, list(1:5, 6:10, 11:15))

  results <- hybridalg(data_2, likelihood = function(X) multivariate(X) - (0.2 * 2^ncol(X)) * log(nrow(X)), allow_parallel = FALSE, threshold = global_threshold)
  expect_equal(results$segments, list(1:10, 11:15))
  doParallel::stopImplicitCluster()
})

test_that("handles corner cases", {
  data <- makeRandom(1000, 0)
  results <- hybridalg(data, likelihood = function(X) multivariate(X) - (0.1 * 2^ncol(X)) * log(nrow(X)), allow_parallel = FALSE, threshold = global_threshold)
  expect_equal(length(results$segments), 0)
})

test_that("works with max_segments", {
  results <- hybridalg(data_1, likelihood = function(X) multivariate(X) - (0.1 * 2^ncol(X)) * log(nrow(X)), allow_parallel = TRUE, max_segments = 2)
  expect_equal(results$segments, list(1:10, 11:15))
})

test_that("handles NaN in likelihood", {
  set.seed(1234)
  data <- makeRandom(5, 20)
  expect_error(
    hybridalg(data, likelihood = function(X) if (ncol(X) == 2) NaN else sum(X)),
    "likelihood returned a NaN when called with likelihood\\(data\\[, 2:3\\]\\)"
  )
})

test_that("fix bug with duplicated changepoints", {
  set.seed(1234)
  data <- segments_1to5_6to10_11to15(2000)
  results <- hybridalg(data, likelihood = function(X) multivariate(X) - (0.1 * 2^ncol(X)) * log(nrow(X)), threshold = global_threshold)
  expect_equal(results$segments, list(1:5, 6:10, 11:15))
})
