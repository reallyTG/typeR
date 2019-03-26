test_that('Fixed-design equicorrelated knockoffs have the right correlation structure', {
  n = 20; p = 10
  X = MFKnockoffs:::normc(MFKnockoffs:::rnorm_matrix(n,p))
  knock_variables_default = MFKnockoffs.create.fixed(X, method='equi', randomize=F)
  knock_variables_randomized = MFKnockoffs.create.fixed(X, method='equi', randomize=T)
  X = knock_variables_default$X
  X_ko_default = knock_variables_default$X_k
  X_ko_randomized = knock_variables_randomized$X_k
  
  G = t(X) %*% X
  s = min(2*min(eigen(G)$values), 1)
  for (X_ko in list(X_ko_default, X_ko_randomized)) {
    expect_equal(t(X_ko) %*% X_ko, G)
    expect_equal(t(X) %*% X_ko, G - diag(s,p,p))
  }
})

# Test case from Weijie Su.
test_that('equicorrelated knockoffs are created in numerically sensitive case', {

  n = 15; p = 5
  M = matrix(0, p, p)
  diag(M) = 1
  for (i in 1:p) {
    for (j in 1:p) {
      if ((i==j+1) || (j==i+1))
        M[i,j] <- 0.6
      if ((i==j+2) || (j==i+2))
        M[i,j] <- 0.1
    }
  }
  X = MFKnockoffs:::with_seed(2, matrix(rnorm(n*p),n) %*% chol(M) )
  k = 4
  
  Z = MFKnockoffs:::normc(X[,-k])
  Z_ko = MFKnockoffs.create.fixed(Z, method='equi', randomize=F)$X_k
  expect_false(any(is.nan(Z_ko)))
})

test_that('Fixed-design SDP knockoffs have the right correlation structure', {
  skip_on_cran()
  
  n = 20; p = 10
  X = MFKnockoffs:::normc(MFKnockoffs:::rnorm_matrix(n,p))
  knock_variables_default = MFKnockoffs.create.fixed(X, method='sdp', randomize=F)
  knock_variables_randomized = MFKnockoffs.create.fixed(X, method='sdp', randomize=T)
  X = knock_variables_default$X
  X_ko_default = knock_variables_default$X_k
  X_ko_randomized = knock_variables_randomized$X_k
  
  offdiag <- function(A) A - diag(diag(A))
  G = t(X) %*% X
  tol = 1e-4
  for (X_ko in list(X_ko_default, X_ko_randomized)) {
    expect_equal(t(X_ko) %*% X_ko, G, tolerance=tol)
    expect_equal(offdiag(t(X) %*% X_ko), offdiag(G), tolerance=tol)
    expect_true(all(diag(t(X) %*% X_ko) < 1+tol))
  }
})

test_that('Gaussian equicorrelated knockoffs have the right correlation structure', {
  # Problem parameters
  n = 10000000   # number of observations
  p = 3          # number of variables
  
  # Generate the variables from a multivariate normal distribution
  mu = c(1,2,3); Sigma = matrix(c(1,0.55,0.2, 0.55,1,0.55, 0.2, 0.55, 1),3)
  
  X = matrix(rep(mu,each=n),n) + matrix(rnorm(n*p),n) %*% chol(Sigma)
  X_k = MFKnockoffs.create.gaussian(X, mu, Sigma, method='equi')
  
  SigmaHat = cov(X_k)
  SigmaHatCross = cov(X, y=X_k)
  muHat = colMeans(X_k)
  
  lambda_min = eigen(Sigma, symmetric=T, only.values = T)$values[p]
  diag_s = diag(rep(1, nrow(Sigma)) * min(2*lambda_min, min(diag(Sigma))))
  
  expect_equal(mu, muHat, tolerance=2e-3)
  expect_equal(Sigma, SigmaHat, tolerance=2e-3)
  expect_equal(Sigma-diag_s, SigmaHatCross, tolerance=2e-3)
})
