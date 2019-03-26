library(mixtools)


### Name: regmixMH
### Title: Metropolis-Hastings Algorithm for Mixtures of Regressions
### Aliases: regmixMH
### Keywords: file

### ** Examples

## M-H algorithm for NOdata with acceptance rate about 40%.

data(NOdata)
attach(NOdata)
set.seed(100)
beta <- matrix(c(1.3, -0.1, 0.6, 0.1), 2, 2)
sigma <- c(.02, .05)
MH.out <- regmixMH(Equivalence, NO, beta = beta, s = sigma, 
                   sampsize = 2500, omega = .0013)
MH.out$theta[2400:2499,]



