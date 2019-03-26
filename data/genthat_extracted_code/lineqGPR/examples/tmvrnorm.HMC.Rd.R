library(lineqGPR)


### Name: tmvrnorm.HMC
### Title: '"tmvrnorm"' Sampler for '"HMC"' (Hamiltonian Monte Carlo) S3
###   Class
### Aliases: tmvrnorm.HMC

### ** Examples

n <- 100
x <- seq(0, 1, length = n)
Sigma <- kernCompute(x1 = x, type = "gaussian", par = c(1,0.2))
tmgPar <- list(mu = rep(0,n), Sigma = Sigma + 1e-9*diag(n), lb = rep(-1,n), ub = rep(1,n))
class(tmgPar) <- "HMC"
y <- tmvrnorm(tmgPar, nsim = 10)
matplot(x, y, type = 'l', ylim = c(-1,1),
        main = "Constrained samples using Hamiltonian MC")
abline(h = c(-1,1), lty = 2)




