library(kyotil)


### Name: make.timedep.dataset
### Title: Create Dataset for Time-dependent Covariate Proportional Hazard
###   Model Analaysi
### Aliases: make.timedep.dataset
### Keywords: time varying

### ** Examples


library(survival)

n=3000; followup.length=5; incidence.density=0.015; age.sim="continuous"

dat.0=sim.dat.tvarying.two(n, followup.length, incidence.density, age.sim, seed=1)
dat=subset(dat.0, for.non.tvarying.ana, select=c(ptid, X, d, baseline.age, trt))
dat.timedep = make.timedep.dataset (dat, "X", "d", "baseline.age", 6)
coxph(Surv(tstart,tstop,d) ~ trt*.timedep.agegrp, dat.timedep)





