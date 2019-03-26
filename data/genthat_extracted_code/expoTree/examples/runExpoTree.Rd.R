library(expoTree)


### Name: runExpoTree
### Title: Density-dependent likelihood caluculation
### Aliases: runExpoTree
### Keywords: likelihood phylogenetics

### ** Examples

times <- cumsum(runif(10))
ttypes <- rep(1,10)

N <- 15
beta <- 1
mu <- 0.1
psi <- 0
rho <- 1
pars <- matrix(c(N,beta,mu,psi,rho),nrow=1)
lik <- runExpoTree(pars,times,ttypes)



