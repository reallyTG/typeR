library(expoTree)


### Name: infExpoTree
### Title: Likelihood calculation without density dependence.
### Aliases: infExpoTree
### Keywords: likelihood phylogenetics

### ** Examples

  times <- cumsum(runif(10))
  ttypes <- rep(1,10)

  N <- 15
  beta <- 1
  mu <- 0.1
  psi <- 0
  rho <- 1

  lik <- infExpoTree(beta,mu,psi,rho,times,ttypes)



