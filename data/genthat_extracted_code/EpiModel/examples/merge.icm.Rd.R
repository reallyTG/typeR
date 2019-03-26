library(EpiModel)


### Name: merge.icm
### Title: Merge Data across Stochastic Individual Contact Model
###   Simulations
### Aliases: merge.icm
### Keywords: extract

### ** Examples

param <- param.icm(inf.prob = 0.2, act.rate = 0.8)
init <- init.icm(s.num = 1000, i.num = 100)
control <- control.icm(type = "SI", nsteps = 10,
                       nsims = 3, verbose = FALSE)
x <- icm(param, init, control)

control <- control.icm(type = "SI", nsteps = 10,
                       nsims = 1, verbose = FALSE)
y <- icm(param, init, control)

z <- merge(x, y)
x$epi
y$epi
z$epi




