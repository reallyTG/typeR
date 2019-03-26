library(BaPreStoPro)


### Name: Diffusion-class
### Title: S4 class of model informations for diffusion process
### Aliases: Diffusion-class

### ** Examples

parameter <- list(phi = 0.1, gamma2 = 0.01)
b.fun <- function(phi, t, y) phi * y
sT.fun <- function(t, y) y
start <- parameter
prior <- list(m.phi = parameter$phi, v.phi = parameter$phi^2,
   alpha.gamma = 3, beta.gamma = 2*parameter$gamma2)
model <- set.to.class("Diffusion", parameter, prior, start,
  b.fun = b.fun, sT.fun = sT.fun)



