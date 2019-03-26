library(BaPreStoPro)


### Name: Merton-class
### Title: S4 class of model informations for a special jump diffusion
###   process, called Merton model
### Aliases: Merton-class

### ** Examples

parameter <- list(phi = 0.01, thetaT = 0.1, gamma2 = 0.01, xi = c(2, 0.2))
Lambda <- function(t, xi) (t / xi[2])^xi[1]
# prior density for xi:
priorDensity <- function(xi) dgamma(xi, c(2, 0.2), 1)
# prior parameter for phi (normal), thetaT (normal) and gamma2 (inverse gamma):
prior <- list(m.phi = parameter$phi, v.phi = parameter$phi, m.thetaT = parameter$thetaT,
   v.thetaT = parameter$thetaT, alpha.gamma = 3, beta.gamma = parameter$gamma2*2)
start <- parameter
model <- set.to.class("Merton", parameter, prior, start, Lambda = Lambda,
   priorDensity = priorDensity)
summary(class.to.list(model))
# default:
model <- set.to.class("Merton", parameter, Lambda = Lambda)



