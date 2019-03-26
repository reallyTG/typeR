library(BaPreStoPro)


### Name: simulate,mixedRegression-method
### Title: Simulation of hierarchical (mixed) regression model
### Aliases: simulate,mixedRegression-method

### ** Examples

mu <- 2; Omega <- 0.4; phi <- matrix(rnorm(21, mu, sqrt(Omega)))
model <- set.to.class("mixedRegression",
   parameter = list(phi = phi, mu = mu, Omega = Omega, gamma2 = 0.1),
   fun = function(phi, t) phi*t, sT.fun = function(t) t)
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, plot.series = TRUE)



