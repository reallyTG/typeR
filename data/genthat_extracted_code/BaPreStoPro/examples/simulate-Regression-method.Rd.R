library(BaPreStoPro)


### Name: simulate,Regression-method
### Title: Simulation of regression model
### Aliases: simulate,Regression-method

### ** Examples

model <- set.to.class("Regression", parameter = list(phi = 5, gamma2 = 0.1),
   fun = function(phi, t) phi*t)
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, plot.series = TRUE)



