library(BaPreStoPro)


### Name: simulate,jumpRegression-method
### Title: Simulation of regression model dependent on Poisson process
### Aliases: simulate,jumpRegression-method

### ** Examples

model <- set.to.class("jumpRegression", fun = function(t, N, theta) theta[1]*t + theta[2]*N,
   parameter = list(theta = c(1,2), gamma2 = 0.1, xi = 10))
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t)



