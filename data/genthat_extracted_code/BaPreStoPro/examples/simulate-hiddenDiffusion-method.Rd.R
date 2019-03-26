library(BaPreStoPro)


### Name: simulate,hiddenDiffusion-method
### Title: Simulation of hidden diffusion process
### Aliases: simulate,hiddenDiffusion-method

### ** Examples

model <- set.to.class("hiddenDiffusion", parameter = list(phi = 0.5, gamma2 = 0.01, sigma2 = 0.1))
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, plot.series = TRUE)



