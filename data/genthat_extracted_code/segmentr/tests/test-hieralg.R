context("hieralg")

set.seed(1234)
data_1 <- segments_1to5_6to10_11to15(2000)
data_2 <- segments_1to10_11to15(5000)

test_that("identifies changepoints differently, if we take into account the different algorithm implementation", {
  results <- hieralg(data_1, likelihood = function(X) multivariate(X) - (0.1 * 2^ncol(X)) * log(nrow(X)))
  expect_equal(results$segments, list(1:5, 6:10, 11:15))

  results <- hieralg(data_2, likelihood = function(X) multivariate(X) - (0.2 * 2^ncol(X)) * log(nrow(X)))
  expect_equal(results$segments, list(1:10, 11:15))
})

test_that("can be called with segment", {
  results <- segment(data_1, likelihood = function(X) multivariate(X) - (0.1 * 2^ncol(X)) * log(nrow(X)), algorithm = "hierarchical")
  expect_equal(results$segments, list(1:5, 6:10, 11:15))

  results <- segment(data_2, likelihood = function(X) multivariate(X) - (0.2 * 2^ncol(X)) * log(nrow(X)), algorithm = "hieralg")
  expect_equal(results$segments, list(1:10, 11:15))
})

test_that("works with a cluster as well", {
  doParallel::registerDoParallel(1)
  results <- hieralg(data_1, likelihood = function(X) multivariate(X) - (0.1 * 2^ncol(X)) * log(nrow(X)), allow_parallel = TRUE)
  expect_equal(results$segments, list(1:5, 6:10, 11:15))

  results <- hieralg(data_2, likelihood = function(X) multivariate(X) - (0.2 * 2^ncol(X)) * log(nrow(X)), allow_parallel = FALSE)
  expect_equal(results$segments, list(1:10, 11:15))
  doParallel::stopImplicitCluster()
})

test_that("handles corner cases", {
  data <- makeRandom(1000, 0)
  results <- hieralg(data, likelihood = function(X) multivariate(X) - (0.1 * 2^ncol(X)) * log(nrow(X)), allow_parallel = FALSE)
  expect_equal(length(results$segments), 0)
})

test_that("works with max_segments", {
  results <- hieralg(data_1, likelihood = function(X) multivariate(X) - (0.1 * 2^ncol(X)) * log(nrow(X)), allow_parallel = TRUE, max_segments = 2)
  expect_true(identical(results$segments, list(1:5, 6:15)) || identical(results$segments, list(1:10, 11:15)))
})

test_that("handles NaN in likelihood", {
  data <- makeRandom(5, 20)
  expect_error(
    hieralg(data, likelihood = function(X) if (ncol(X) == 2) NaN else sum(X)),
    "likelihood returned a NaN when called with likelihood\\(data\\[, 1:2\\]\\)"
  )
})
