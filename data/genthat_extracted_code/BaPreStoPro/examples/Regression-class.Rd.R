library(BaPreStoPro)


### Name: Regression-class
### Title: S4 class of model informations for the regression model
### Aliases: Regression-class

### ** Examples

parameter <- list(phi = c(3, 1), gamma2 = 0.1)
fun <- function(phi, t) phi[1] + phi[2]*t
sT.fun <- function(t) t
prior <- list(m.phi = parameter$phi, v.phi = parameter$phi^2,
   alpha.gamma = 3, beta.gamma = 2*parameter$gamma2)
start <- parameter
model <- set.to.class("Regression", parameter, prior, start, fun = fun, sT.fun = sT.fun)



