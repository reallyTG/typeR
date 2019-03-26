library(tawny)


### Name: cov_shrink
### Title: Shrink the covariance matrix towards some global mean
### Aliases: cov_shrink cov_sample cov.prior.cc cov.prior.identity cor.mean
###   shrinkage.p shrinkage.r shrinkage.c shrinkage.intensity cov.shrink
###   cov.sample
### Keywords: ts

### ** Examples

  require(tawny.types)
  # Estimate the covariance matrix based on the given asset returns
  data(sp500.subset)
  ys <- TawnyPortfolio(sp500.subset, 150)
  S.hat <- cov_shrink(ys)

  # Optimize the portfolio weights using the shrinkage estimator
  ws <- optimizePortfolio(ys, ShrinkageDenoiser())

  # Calculate the sample covariance matrix
  S <- cov.sample(ys$returns)

  # Calculate the shrinkage coefficient
  F <- cov.prior.cc(S)
  k <- shrinkage.intensity(ys$returns, F, S)



