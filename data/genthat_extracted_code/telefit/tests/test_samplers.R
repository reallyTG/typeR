context("Samplers")

test_that("Sampling x ~ N(Sigma %*% y, Sigma) with Q = inv(Sigma)", {
  set.seed(2000)
  
  n = 5
  Sigma = matrix(rnorm(n^2), ncol=n)
  Sigma = Sigma %*% t(Sigma)
  y = rnorm(n)
  mu = Sigma %*% y
  
  x = t(.Call(`_telefit_r_mvrnorm_post`, y, solve(Sigma), 1e6, T))
  
  # test passes if relative error in sample mean AND covariance is < 1.5%
  expect_lt(max( abs((colMeans(x) - mu) / mu) * 100, 
                 abs((cov(x) - Sigma) / Sigma) * 100), 1.5)
})


test_that("Sampling x ~ N((A x B) %*% y, (A x B)) with Qa=inv(A), Qb=inv(B)", {
  set.seed(2000)
  
  nA = 5
  nB = 3
  A = matrix(rnorm(nA^2), ncol=nA)
  B = matrix(rnorm(nB^2), ncol=nB)
  A = A %*% t(A)
  B = B %*% t(B)
  Sigma = kronecker(A, B)
  y = rnorm(nA * nB)
  mu = Sigma %*% y
  
  x = t(.Call(`_telefit_r_mvrnorm_postKron`, y, solve(A), solve(B), 1e6, T))
  
  # test passes if mean relative error in sample mean AND covariance is < 1%
  expect_lt(mean( c(abs((colMeans(x) - mu) / mu) * 100, 
                    abs((cov(x) - Sigma) / Sigma) * 100)), 1)
})