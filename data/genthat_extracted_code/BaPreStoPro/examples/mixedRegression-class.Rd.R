library(BaPreStoPro)


### Name: mixedRegression-class
### Title: S4 class of model informations for the hierarchical (mixed)
###   regression model
### Aliases: mixedRegression-class

### ** Examples

mu <- c(2, 1); Omega <- c(1, 0.04)
phi <- sapply(1:2, function(i) rnorm(21, mu[i], sqrt(Omega[i])))
parameter <- list(phi = phi, mu = mu, Omega = Omega, gamma2 = 0.01)
fun <- function(phi, t) phi[1] + phi[2]*t
sT.fun <- function(t) t
prior <- list(m.mu = parameter$mu, v.mu = parameter$mu^2,
   alpha.omega = rep(3, length(parameter$mu)), beta.omega = parameter$Omega*2,
   alpha.gamma = 3, beta.gamma = parameter$gamma2*2)
start <- parameter
model <- set.to.class("mixedRegression", parameter, prior, start, fun = fun, sT.fun = sT.fun)



