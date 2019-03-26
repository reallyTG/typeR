library(BaPreStoPro)


### Name: hiddenmixedDiffusion-class
### Title: S4 class of model informations for hierarchical (mixed) hidden
###   diffusion process
### Aliases: hiddenmixedDiffusion-class

### ** Examples

mu <- c(2, 1); Omega <- c(1, 0.04)
phi <- sapply(1:2, function(i) rnorm(21, mu[i], sqrt(Omega[i])))
parameter <- list(phi = phi, mu = mu, Omega = Omega, gamma2 = 0.1, sigma2 = 0.1)
b.fun <- function(phi, t, y) phi[1] * y
sT.fun <- function(t, y) y
y0.fun <- function(phi, t) phi[2]
start <- parameter
prior <- list(m.mu = parameter$mu, v.mu = parameter$mu^2,
   alpha.omega = rep(3, length(parameter$mu)), beta.omega = parameter$Omega*2,
   alpha.gamma = 3, beta.gamma = parameter$gamma2*2,
   alpha.sigma = 3, beta.sigma = parameter$sigma2*2)
model <- set.to.class("hiddenmixedDiffusion", parameter, prior, start,
  b.fun = b.fun, sT.fun = sT.fun, y0.fun = y0.fun)



