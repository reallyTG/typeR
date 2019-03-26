.runThisTest <- Sys.getenv("RunAllRcppTests") == "yes"

if (.runThisTest) {
  library(fuser)

  # Test of Rcpp code for l1 fusion
  set.seed(123)

  # Generate simple heterogeneous dataset
  k = 4 # number of groups
  p = 10001 # number of covariates, high enough to trigger
  # calculation of cross-products on the fly
  n.group = 500 # number of samples per group
  sigma = 0.05 # observation noise sd
  groups = rep(1:k, each=n.group) # group indicators

  # sparse linear coefficients
  beta = matrix(0, p, k)
  nonzero.ind = rbinom(p*k, 1, 0.0025/k) # Independent coefficients
  nonzero.shared = rbinom(p, 1, 0.0025) # shared coefficients
  beta[which(nonzero.ind==1)] = rnorm(sum(nonzero.ind), 1, 0.25)
  beta[which(nonzero.shared==1),] = rnorm(sum(nonzero.shared), -1, 0.25)

  X = lapply(1:k, function(k.i) matrix(rnorm(n.group*p),n.group, p)) # covariates
  y = sapply(1:k, function(k.i) X[[k.i]] %*% beta[,k.i] + rnorm(n.group, 0, sigma)) # response
  X = do.call('rbind', X)

  # Pairwise Fusion strength hyperparameters (tau(k,k'))
  # Same for all pairs in this example
  G = matrix(1, k, k)

  # Use L1 fusion to estimate betas (with near-optimal sparsity and
  # information sharing among groups)
  # Note, this will not converge in 500 iterations
  beta.estimate = fusedLassoProximal(X, y, groups, lambda=1e-3, num.it=500,
                                     gamma=1e-2, G, intercept=FALSE)

  # Check that Rcpp code gives equivalent result
  beta.estimate.2 = fusedLassoProximal(X, y, groups, lambda=1e-3, num.it=500,
                                       gamma=1e-2, G, intercept=FALSE, c.flag=TRUE)

  test_that("L1 Fusion: Compare Rcpp result with pure R code.", {
    expect_lt(mean((c(beta.estimate)-c(beta.estimate.2))^2), 0.005)
  })

}
