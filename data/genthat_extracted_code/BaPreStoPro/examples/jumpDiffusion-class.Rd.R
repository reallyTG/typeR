library(BaPreStoPro)


### Name: jumpDiffusion-class
### Title: S4 class of model informations for the jump diffusion process
### Aliases: jumpDiffusion-class

### ** Examples

parameter <- list(phi = 0.01, theta = 0.1, gamma2 = 0.01, xi = c(2, 0.2))
b.fun <- function(phi, t, y) phi * y
s.fun <- function(gamma2, t, y) sqrt(gamma2) * y
h.fun <- function(theta, t, y) theta * y
Lambda <- function(t, xi) (t / xi[2])^xi[1]
priorDensity <- list(
  phi = function(phi) 1,
  theta = function(theta) dnorm(theta, 0.1, 0.001),
  gamma2 = function(gamma2) dgamma(1/gamma2, 3, 0.01*2),
  xi = function(xi) dgamma(xi, c(2, 0.2), 1)
)
start <- parameter
model <- set.to.class("jumpDiffusion", parameter, start = start,
  b.fun = b.fun, s.fun = s.fun, h.fun = h.fun, Lambda = Lambda,
  priorDensity = priorDensity)



