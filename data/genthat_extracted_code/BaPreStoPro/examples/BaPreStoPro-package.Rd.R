library(BaPreStoPro)


### Name: BaPreStoPro-package
### Title: Bayesian Prediction of Stochastic Processes
### Aliases: BaPreStoPro-package BaPreStoPro
### Keywords: package, (jump) diffusion, mixed (hidden) diffusion,
###   non-homogeneous Poisson process

### ** Examples

model <- set.to.class("Diffusion", parameter = list(phi = 0.5, gamma2 = 0.01))
t <- seq(0, 1, by = 0.1)
data <- simulate(model, t = t, y0 = 0.5, plot.series = TRUE)
est <- estimate(model, t, data, 10) # better: 10000
plot(est)
pred <- predict(est)




