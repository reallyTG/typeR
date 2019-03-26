library(BaPreStoPro)


### Name: estimate,Merton-method
### Title: Estimation for jump diffusion process
### Aliases: estimate,Merton-method

### ** Examples

model <- set.to.class("Merton", parameter = list(thetaT = 0.1, phi = 0.05, gamma2 = 0.1, xi = 10))
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, y0 = 0.5, plot.series = TRUE)
est <- estimate(model, t, data, 1000)
plot(est)
## Not run: 
##D est_hidden <- estimate(model, t, data$Y, 1000)
##D plot(est_hidden)
## End(Not run)



