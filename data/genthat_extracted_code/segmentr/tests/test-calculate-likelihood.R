context("methods")

segments_1to5_6to10_11to15 <- function(N) {
  X1 <- sample(1:2, N, replace = TRUE)
  X2 <- sample(1:2, N, replace = TRUE)
  X3 <- sample(1:2, N, replace = TRUE)
  X4 <- sample(1:2, N, replace = TRUE)
  X5 <- sample(1:2, N, replace = TRUE)
  X6 <- sample(1:2, N, replace = TRUE)
  X <- cbind(X1, X1 - X2, X2, X1 + X2, X1, X3, X3 - X4, X4, X3 + X4, X3, X5, X5 - X6, X6, X5 + X6, X5)
  X
}

test_that("calculate likelihood of existing type", {
  points <- rbind(1:7)

  mult_likelihood <- prod

  results <- list(changepoints = c(3, 5))
  class(results) <- "segmentr"

  likelihood <- calculate_likelihood(results, points, likelihood = prod)
  expect_equal(likelihood, (1 * 2) + (3 * 4) + (5 * 6 * 7))
})

test_that("works with segment function on both algorithms", {
  set.seed(1234)
  data <- segments_1to5_6to10_11to15(2000)
  results <- segment(data, likelihood = function(X) multivariate(X) - (0.1 * 2^ncol(X)) * log(nrow(X)))
  likelihood <- calculate_likelihood(results, data, likelihood = multivariate)
  expect_equal(likelihood, -8316, tolerance = 0.1)

  results <- segment(data, likelihood = function(X) multivariate(X) - (0.1 * 2^ncol(X)) * log(nrow(X)), algorithm = "hieralg")
  likelihood <- calculate_likelihood(results, data, likelihood = multivariate)
  expect_equal(likelihood, -8316, tolerance = 0.1)

  results <- segment(data, likelihood = function(X) multivariate(X) - (0.1 * 2^ncol(X)) * log(nrow(X)), algorithm = "hybrid")
  likelihood <- calculate_likelihood(results, data, likelihood = multivariate)
  expect_equal(likelihood, -8316, tolerance = 1)
})
