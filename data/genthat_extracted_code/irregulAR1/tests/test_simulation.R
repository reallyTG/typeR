context("Simulation functions")

library(Matrix)

ar1_cov_xy <- function(obs_idx, pred_idx = obs_idx, rho, sigma) {
  sigma^2 / (1 - rho^2) * rho^outer(pred_idx, obs_idx,
                                    function(x, y) abs(x-y))
}

test_that("ar1_sim_consecutive", {
  n <- 5
  mu <- 1:n
  s <- 3
  r <- 0.5
  set.seed(123)
  x <- ar1_sim_consecutive(n, r, s, mu)
  set.seed(123)
  y <- numeric(n)
  y[1] <- rnorm(1) * s / sqrt(1-r^2)
  for (i in 2:n) y[i] <- r * y[i-1] + rnorm(1) * s
  y <- mu + y
  expect_equal(x, y)
})

test_that("ar1_sim_irregular", {
  t <- c(1, 4, 7:9, 13)
  mu <- 1:length(t)
  s <- 3
  r <- 0.5
  set.seed(123)
  x1 <- ar1_sim_irregular(t, r, s, mu)

  set.seed(123)
  z <- rnorm(length(t))
  U <- chol(ar1_prec_irregular(t, r, s))
  x2 <- as.vector(solve(U, z) + mu)
  expect_equal(x1, x2)
})


test_that("ar1_sim_conditional", {
  s <- 0.5
  r <- 0.5
  t_pred <- c(1, 3, 6:7, 19)
  t_obs <- c(2, 5, 11:14)
  mu_obs <- t_obs
  x_obs <- mu_obs + rnorm(length(t_obs), sd = s)
  mu_pred <- t_pred

  S_o <- ar1_cov_xy(t_obs, t_obs, r, s)
  S_op <- ar1_cov_xy(t_pred, t_obs, r, s)
  A <- t(solve(S_o, S_op))
  mu_po <- mu_pred + A %*% (x_obs - mu_obs)
  S_po <- Matrix::symmpart(ar1_cov_xy(t_pred, t_pred, r, s) - A %*% S_op)

  n <- 1000
  m1 <- rep(0, length(t_pred))
  m2 <- rep(0, length(t_pred))
  for (i in 1:n) {
    x1 <- ar1_sim_conditional(t_pred, t_obs, x_obs, r, s, mu_pred, mu_obs)
    x2 <- as.vector(mvtnorm::rmvnorm(1, mu_po, S_po))
    m1 <- m1 + (x1 - m1) / i
    m2 <- m2 + (x2 - m2) / i
  }
  # https://stats.stackexchange.com/a/201864/13952
  d <- max(abs(2*atan(m1 / m2) - pi/2))
  eps <- 10^(-log10(n)+2)
  expect_equal(d, 0, tolerance = eps)
})
