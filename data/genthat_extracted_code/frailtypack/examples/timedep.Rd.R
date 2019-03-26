library(frailtypack)


### Name: timedep
### Title: Identify time-varying effects
### Aliases: timedep
### Keywords: misc

### ** Examples



## Not run: 
##D 
##D data(readmission)
##D 
##D ###--- Shared Frailty model with time-varying effect ---###
##D 
##D sha.time <- frailtyPenal(Surv(time,event)~cluster(id)+dukes+charlson+
##D timedep(sex)+chemo,data=readmission,n.knots=8,kappa=1,
##D betaknots=3,betaorder=3)
##D 
##D #-- print results of the fit and the associated curves for the
##D #-- time-dependent effects
##D print(sha.time)
##D 
##D ###--- Joint Frailty model with time-varying effect ---###
##D 
##D joi.time <- frailtyPenal(Surv(time,event)~cluster(id)+timedep(sex)+
##D chemo+terminal(death),formula.terminalEvent=~timedep(sex)+chemo,
##D data=readmission,n.knots=8,kappa=c(1,1),betaknots=3,betaorder=3)
##D 
##D print(joi.time)
##D 
## End(Not run)





