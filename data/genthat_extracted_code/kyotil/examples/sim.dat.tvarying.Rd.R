library(kyotil)


### Name: sim.dat.tvarying.two
### Title: Simulation Functions for Time-dependent Proportional Hazard
###   Model
### Aliases: sim.dat.tvarying.two sim.dat.tvarying.three

### ** Examples


library(survival)

dat=sim.dat.tvarying.three(n=6000,followup.length=3, incidence.density=0.05, 
    age.sim="tvaryinggroup", seed=1)
f.tvarying = Surv(tstart,tstop,d) ~ trt*agegrp 
f =          Surv(X,d)            ~ trt*baseline.agegrp 
fits=list()
fits[["tvarying"]]=coxph(f.tvarying, dat)
fits[["baseline"]]=coxph(f, subset(dat, for.non.tvarying.ana))
fits










