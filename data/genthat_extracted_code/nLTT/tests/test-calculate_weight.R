context("calculate_weight")


test_that("calculate_weight use", {
  weights <- rep(1, 2)
  particles <- list()
  for (i in 1:2) {
    particles[[i]] <- c(10, 10)
  }
  sigma <- 1
  pdf <- function(x) {
    dunif(x[1], min = 0, max = 1000) *
    dunif(x[2], min = 0, max = 1000)
  }

  expect_equal(
    calculate_weight(weights, particles,
      current = c(5, 5), sigma, pdf),
    calculate_weight(weights, particles,
      current = c(20, 20), sigma, pdf),
    tolerance = 0.0001
  )

  expect_equal(
    calculate_weight(weights, particles,
      current = c(5, 5), sigma, pdf),
    calculate_weight(weights, particles,
      current = c(5.0, 5.0), sigma, pdf),
    tolerance = 0.0001
  )
})
