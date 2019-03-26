library(monomvn)


### Name: metrics
### Title: RMSE, Expected Log Likelihood and KL Divergence Between Two
###   Multivariate Normal Distributions
### Aliases: kl.norm Ellik.norm rmse.muS
### Keywords: multivariate

### ** Examples

mu1 <- rnorm(5)
s1 <- matrix(rnorm(100), ncol=5)
S1 <- t(s1) %*% s1

mu2 <- rnorm(5)
s2 <- matrix(rnorm(100), ncol=5)
S2 <- t(s2) %*% s2

## RMSE
rmse.muS(mu1, S1, mu2, S2)

## expected log likelihood
Ellik.norm(mu1, S1, mu2, S2)

## KL is not symmetric
kl.norm(mu1, S1, mu2, S2)
kl.norm(mu2, S2, mu1, S1)

## symmetric version
kl.norm(mu2, S2, mu1, S1, symm=TRUE)



