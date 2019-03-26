library(BaPreStoPro)


### Name: simulate,jumpDiffusion-method
### Title: Simulation of jump diffusion process
### Aliases: simulate,jumpDiffusion-method

### ** Examples

model <- set.to.class("jumpDiffusion",
   parameter = list(theta = 0.1, phi = 0.05, gamma2 = 0.1, xi = c(3, 1/4)),
   Lambda = function(t, xi) (t/xi[2])^xi[1])
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, y0 = 0.5)



