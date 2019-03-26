library(EpiModel)


### Name: summary.icm
### Title: Summary Model Statistics
### Aliases: summary.icm
### Keywords: extract

### ** Examples

## Stochastic ICM SI model with 3 simulations
param <- param.icm(inf.prob = 0.2, act.rate = 1)
init <- init.icm(s.num = 500, i.num = 1)
control <- control.icm(type = "SI", nsteps = 50,
                       nsims = 5, verbose = FALSE)
mod <- icm(param, init, control)
summary(mod, at = 25)
summary(mod, at = 50)




