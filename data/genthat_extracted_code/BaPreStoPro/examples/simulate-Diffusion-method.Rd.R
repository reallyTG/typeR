library(BaPreStoPro)


### Name: simulate,Diffusion-method
### Title: Simulation of diffusion process
### Aliases: simulate,Diffusion-method

### ** Examples

model <- set.to.class("Diffusion", parameter = list(phi = 0.5, gamma2 = 0.01))
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, y0 = 0.5, plot.series = TRUE)



