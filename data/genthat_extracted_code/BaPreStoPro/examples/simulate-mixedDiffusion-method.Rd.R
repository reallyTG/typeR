library(BaPreStoPro)


### Name: simulate,mixedDiffusion-method
### Title: Simulation of hierarchical (mixed) diffusion model
### Aliases: simulate,mixedDiffusion-method

### ** Examples

mu <- 2; Omega <- 0.4; phi <- matrix(rnorm(21, mu, sqrt(Omega)))
model <- set.to.class("mixedDiffusion", y0.fun = function(phi, t) 0.5,
  parameter = list(phi = phi, mu = mu, Omega = Omega, gamma2 = 0.1),
  b.fun = function(phi, t, x) phi*x, sT.fun = function(t, x) x)
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, plot.series = TRUE)



