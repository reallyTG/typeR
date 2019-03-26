library(BHTSpack)


### Name: mu.k.u
### Title: package internal function
### Aliases: mu.k.u

### ** Examples

  K = 5
  n = 100
  z = abs(rnorm(n))
  sigma = sapply(1:K, function(x){1/rgamma(n=1, shape=10, rate=10)})
  mu0 = 0
  ik = sample(K, n, replace=TRUE)
  sapply(1:K, mu.k.u, ik, z, sigma, mu0)



