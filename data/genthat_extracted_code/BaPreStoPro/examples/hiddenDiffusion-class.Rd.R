library(BaPreStoPro)


### Name: hiddenDiffusion-class
### Title: S4 class of model informations for hidden diffusion process
### Aliases: hiddenDiffusion-class

### ** Examples

parameter <- list(phi = c(2, 1), gamma2 = 0.1, sigma2 = 0.1)
b.fun <- function(phi, t, y) phi[1] * y
sT.fun <- function(t, y) y
y0.fun <- function(phi, t) phi[2]
start <- parameter
prior <- list(m.phi = parameter$phi, v.phi = parameter$phi^2, alpha.gamma = 3,
   beta.gamma = parameter$gamma2*2, alpha.sigma=3, beta.sigma=parameter$sigma2*2)
model <- set.to.class("hiddenDiffusion", parameter, prior, start,
  b.fun = b.fun, sT.fun = sT.fun, y0.fun = y0.fun)



