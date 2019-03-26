library(GMCM)


### Name: dgmcm.loglik
### Title: Probability, density, and likelihood functions of the Gaussian
###   mixture (copula) model
### Aliases: dgmcm.loglik dgmm.loglik dgmm.loglik.marginal pgmm.marginal
###   qgmm.marginal
### Keywords: internal

### ** Examples

set.seed(1)
data <- SimulateGMCMData(n = 10)
u <- data$u
z <- data$z
print(theta <- data$theta)

GMCM:::dgmcm.loglik(theta, u, marginal.loglik = FALSE)
GMCM:::dgmcm.loglik(theta, u, marginal.loglik = TRUE)

GMCM:::dgmm.loglik(theta, z, marginal.loglik = FALSE)
GMCM:::dgmm.loglik(theta, z, marginal.loglik = TRUE)

GMCM:::dgmm.loglik.marginal(theta, z, marginal.loglik = FALSE)
GMCM:::dgmm.loglik.marginal(theta, z, marginal.loglik = TRUE)

GMCM:::pgmm.marginal(z, theta)
GMCM:::qgmm.marginal(u, theta)



