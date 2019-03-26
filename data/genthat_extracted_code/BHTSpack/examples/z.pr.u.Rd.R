library(BHTSpack)


### Name: z.pr.u
### Title: package internal function
### Aliases: z.pr.u

### ** Examples

  Nmax = 100
  K = 5
  H = 10
  M = 20
  n = sample(Nmax, M, replace=TRUE)

  z = abs(rnorm(sum(n)))
  mu = abs(rnorm(K))
  sigma = 1/rgamma(n=K, shape=10, rate=10)

  hk = sample(K,M*H, replace=TRUE)

  ph = as.vector(sapply(1:M, function(x){lambda.u(rbeta(H, 1, 1))}))

  z.pr.u(z, hk, mu, sigma, ph, H, n)



