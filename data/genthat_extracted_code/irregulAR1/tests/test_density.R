context("Density functions")

ar1_cov_xy <- function(obs_idx, pred_idx = obs_idx, rho, sigma) {
  sigma^2 / (1 - rho^2) * rho^outer(pred_idx, obs_idx,
                                    function(x, y) abs(x-y))
}

test_that("ar1_lpdf", {
  t <- c(1, 4, 7:9, 13)
  s <- 3
  r <- 0.5

  x <- rnorm(length(t), t)

  lp1 <- ar1_lpdf(x, t, r, s, mu = t)
  S <- ar1_cov_xy(t, t, r, s)
  lp2 <- mvtnorm::dmvnorm(x = x, mean = t, sigma = S, log = TRUE)
  expect_equal(lp1, lp2)
})