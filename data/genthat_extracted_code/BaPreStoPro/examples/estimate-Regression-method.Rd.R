library(BaPreStoPro)


### Name: estimate,Regression-method
### Title: Estimation for regression model
### Aliases: estimate,Regression-method

### ** Examples

t <- seq(0,1, by = 0.01)
model <- set.to.class("Regression", fun = function(phi, t) phi[1]*t + phi[2],
                   parameter = list(phi = c(1,2), gamma2 = 0.1))
data <- simulate(model, t = t, plot.series = TRUE)
est <- estimate(model, t, data, 1000)
plot(est)



