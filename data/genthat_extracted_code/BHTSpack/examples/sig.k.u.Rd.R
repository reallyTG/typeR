library(BHTSpack)


### Name: sig.k.u
### Title: package internal function
### Aliases: sig.k.u

### ** Examples

  K = 5
  n = 100
  z = abs(rnorm(n))
  mu0 = 0
  ik = sample(K, n, replace=TRUE)
  a0 = 5
  b0 = 5
  sapply(1:K, sig.k.u, ik, z, mu0, a0, b0)



