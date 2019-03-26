library(EpiModel)


### Name: summary.dcm
### Title: Summary Model Statistics
### Aliases: summary.dcm
### Keywords: extract

### ** Examples

## Deterministic SIR model with varying act.rate
param <- param.dcm(inf.prob = 0.2, act.rate = 2:4, rec.rate = 1/3,
                   a.rate = 0.011, ds.rate = 0.01,
                   di.rate = 0.03, dr.rate = 0.01)
init <- init.dcm(s.num = 1000, i.num = 1, r.num = 0)
control <- control.dcm(type = "SIR", nsteps = 50)
mod <- dcm(param, init, control)
summary(mod, at = 25, run = 1)
summary(mod, at = 25, run = 3)
summary(mod, at = 26, run = 3)




