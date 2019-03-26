library(DPtree)


### Name: DPTreePosterior
### Title: D-P tree posterior updating from a single copula observation.
### Aliases: DPTreePosterior

### ** Examples

nsim = 1
rho = 0.9
data1 <- MASS::mvrnorm(n=nsim, mu=rep(0, 2), Sigma=matrix(c(1, rho, rho, 1), 2, 2))
data2 <- stats::pnorm(data1)
DPTreePosterior(x=data2, prior=DPTreePrior(m=4, z=1))



