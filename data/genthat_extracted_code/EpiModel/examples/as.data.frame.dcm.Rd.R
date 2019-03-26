library(EpiModel)


### Name: as.data.frame.dcm
### Title: Extract Model Data for Deterministic Compartmental Models
### Aliases: as.data.frame.dcm
### Keywords: extract

### ** Examples

## Example 1: One-group SIS model with varying act.rate
param <- param.dcm(inf.prob = 0.2, act.rate = seq(0.05, 0.5, 0.05),
                   rec.rate = 1/50)
init <- init.dcm(s.num = 500, i.num = 1)
control <- control.dcm(type = "SIS", nsteps = 10)
mod1 <- dcm(param, init, control)
as.data.frame(mod1)
as.data.frame(mod1, run = 1)
as.data.frame(mod1, run = 10)

## Example 2: Two-group SIR model with vital dynamics
param <- param.dcm(inf.prob = 0.2, inf.prob.g2 = 0.1,
                   act.rate = 3, balance = "g1",
                   rec.rate = 1/50, rec.rate.g2 = 1/50,
                   a.rate = 1/100, a.rate.g2 = NA,
                   ds.rate = 1/100, ds.rate.g2 = 1/100,
                   di.rate = 1/90, di.rate.g2 = 1/90,
                   dr.rate = 1/100, dr.rate.g2 = 1/100)
init <- init.dcm(s.num = 500, i.num = 1, r.num = 0,
                 s.num.g2 = 500, i.num.g2 = 1, r.num.g2 = 0)
control <- control.dcm(type = "SIR", nsteps = 10)
mod2 <- dcm(param, init, control)
as.data.frame(mod2)




