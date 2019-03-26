library(flexsurv)


### Name: sim.fmsm
### Title: Simulate paths through a fully parametric semi-Markov
###   multi-state model
### Aliases: sim.fmsm
### Keywords: models,survival

### ** Examples


bexp <- flexsurvreg(Surv(years, status) ~ trans, data=bosms3, dist="exp")
tmat <- rbind(c(NA,1,2),c(NA,NA,3),c(NA,NA,NA))
sim.fmsm(bexp, M=10, t=5, trans=tmat)



