library(BaPreStoPro)


### Name: simulate,Merton-method
### Title: Simulation of jump diffusion process
### Aliases: simulate,Merton-method

### ** Examples

model <- set.to.class("Merton", parameter = list(thetaT = 0.1, phi = 0.05, gamma2 = 0.1, xi = 10))
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, y0 = 0.5)



