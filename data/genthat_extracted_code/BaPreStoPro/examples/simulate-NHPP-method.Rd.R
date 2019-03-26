library(BaPreStoPro)


### Name: simulate,NHPP-method
### Title: Simulation of Poisson process
### Aliases: simulate,NHPP-method

### ** Examples

model <- set.to.class("NHPP", parameter = list(xi = c(5, 1/2)),
                      Lambda = function(t, xi) (t/xi[2])^xi[1])
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t)



