library(zipfR)


### Name: beta_gamma
### Title: Incomplete Beta and Gamma Functions (zipfR)
### Aliases: Cgamma Rgamma Rgamma.inv Igamma Igamma.inv Cbeta Rbeta
###   Rbeta.inv Ibeta Ibeta.inv
### Keywords: math

### ** Examples


Cgamma(5 + 1) # = factorial(5)

## P(X >= k) for Poisson distribution with mean alpha
alpha <- 5
k <- 10
Rgamma(k, alpha) # == ppois(k-1, alpha, lower=FALSE)

n <- 49
k <- 6
1 / ((n+1) * Cbeta(n-k+1, k+1)) # == choose(n, k)

## P(X >= k) for binomial distribution with parameters n and p
n <- 100
p <- .1
k <- 15
Rbeta(p, k, n-k+1) # == pbinom(k-1, n, p, lower=FALSE)




