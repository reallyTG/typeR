library(BHTSpack)


### Name: bhts
### Title: Bayesian High-Throughput Screening
### Aliases: bhts

### ** Examples

  set.seed(1234)
  Nmax = 100
  M = 100
  n = sample(Nmax, M, replace=TRUE)
  Z = lapply(n, function(x){abs(rnorm(x))})
  bhts(Z, iters=100, H=10, K=5, mu00=0, mu10=10, a.alpha=10, b.alpha=5, a.tau=10, b.tau=5)



