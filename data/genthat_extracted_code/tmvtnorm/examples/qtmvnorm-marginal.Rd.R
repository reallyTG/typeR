library(tmvtnorm)


### Name: qtmvnorm-marginal
### Title: Quantiles of the Truncated Multivariate Normal Distribution in
###   one dimension
### Aliases: qtmvnorm.marginal
### Keywords: distribution multivariate

### ** Examples

# finite dimensional distribution of the Geometric Brownian Motion log-returns 
# with truncation

# volatility p.a.
sigma=0.4

# risk free rate
r = 0.05

# n=3 points in time
T <- c(0.5, 0.7, 1)

# covariance matrix of Geometric Brownian Motion returns
Sigma = sigma^2*outer(T,T,pmin)

# mean vector of the Geometric Brownian Motion returns
mu    = (r - sigma^2/2) * T

# lower truncation vector a (a<=x<=b)
a = rep(-Inf, 3)

# upper truncation vector b (a<=x<=b)
b = c(0, 0, Inf)

# quantile of the t_1 returns
qtmvnorm.marginal(p=0.95, interval = c(-10, 10), tail = "lower.tail", n=1, 
  mean  = mu, sigma = Sigma, lower=a, upper=b)



