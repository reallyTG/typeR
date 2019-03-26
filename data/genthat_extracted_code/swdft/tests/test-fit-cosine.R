context("Estimation Local Cosine")

test_that("Local cosine estimation procedure works", {
  N <- 25
  window_size <- 2^3
  A <- 1
  Fr <- 4
  f <- (Fr * window_size) / N
  phase <- 1
  S <- 10
  L <- 10
  x <- local_signal(N=N, A=A, Fr=Fr, phase=phase, S=S, L=L)

  # Take the SWDFT and use it to estimate the local cosine signal's parameters
  b <- swdft(x=x, n=window_size, normalize=(1/sqrt(window_size)))
  bhat <- fit_local_cosine(b)

  # Verify that noiseless case recovers the true parametersto within one decimal place
  expect_true( round( bhat$ls_params["A"] - A, digits = 1)  == 0)
  expect_true( round( bhat$ls_params["S"] - S, digits = 1)  == 0)
  expect_true( round( bhat$ls_params["L"] - L, digits = 1)  == 0)
  expect_true( round( bhat$ls_params["f"] - f, digits = 1)  == 0)
  expect_true( round( bhat$ls_params["phase"] - phase, digits = 1)  == 0)
})
