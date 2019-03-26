library(tmvtnorm)


### Name: mtmvnorm
### Title: Computation of Mean Vector and Covariance Matrix For Truncated
###   Multivariate Normal Distribution
### Aliases: mtmvnorm moments
### Keywords: distribution multivariate

### ** Examples

  mu    <- c(0.5, 0.5, 0.5)
  sigma <- matrix(c(  1,  0.6, 0.3,
                    0.6,    1, 0.2,
                    0.3,  0.2,   2), 3, 3)
                    
  a  <- c(-Inf, -Inf, -Inf)
  b  <- c(1, 1, 1)

  # compute first and second moments
  mtmvnorm(mu, sigma, lower=a, upper=b)
  
  # compare with simulated results
  X <- rtmvnorm(n=1000, mean=mu, sigma=sigma, lower=a, upper=b)
  colMeans(X)
  cov(X)



