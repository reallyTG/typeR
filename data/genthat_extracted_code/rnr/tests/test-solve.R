context("sensitize")

test_that("solve_closed() finds correct value for atomic vector", {
  ps <- seq(0, 1, 0.01)
  delta <- 2
  theta <- 1

  for (p in ps) {
    lhs <- 1 - (p*inv_logit(theta) + (1 - p)*inv_logit(theta + delta))
    generated <- solve_closed(p, delta, lhs)
    expect_equal(generated, theta)
  }
})

test_that("solve() finds correct value for vector of values", {
  ps <- seq(0, 1, 0.01)
  delta <- 2
  theta <- (ps - mean(ps))*5  # Just some reasonable value should do

  lhs <- 1 - (ps*inv_logit(theta) + (1 - ps)*inv_logit(theta + delta))
  generated <- solve_closed(ps, delta, lhs)
  expect_equal(generated, theta)
})
