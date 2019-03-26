library(BaPreStoPro)


### Name: jumpRegression-class
### Title: S4 class of model informations for the jump regression model
### Aliases: jumpRegression-class

### ** Examples

parameter <- list(theta = c(3, 1), gamma2 = 0.1, xi = c(2, 0.2))
fun <- function(t, N, theta) theta[1]*t + theta[2]*N
sT.fun <- function(t) t
Lambda <- function(t, xi) (t / xi[2])^xi[1]
prior <- list(m.theta = parameter$theta, v.theta = parameter$theta^2,
   alpha.gamma = 3, beta.gamma = parameter$gamma2*2)
start <- parameter
model <- set.to.class("jumpRegression", parameter, prior, start = start,
  fun = fun, sT.fun = sT.fun, Lambda = Lambda)



