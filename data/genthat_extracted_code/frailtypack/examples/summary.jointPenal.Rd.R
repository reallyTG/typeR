library(frailtypack)


### Name: summary.jointPenal
### Title: summary of parameter estimates of a joint frailty model
### Aliases: summary.jointPenal print.summary.jointPenal
### Keywords: methods

### ** Examples



## Not run: 
##D 
##D data(readmission)
##D 
##D #-- gap-time
##D modJoint.gap <- frailtyPenal(Surv(time,event)~cluster(id)+sex+dukes+
##D charlson+terminal(death),formula.terminalEvent=~sex+dukes+charlson,
##D data=readmission,n.knots=14,kappa=c(9.55e+9,1.41e+12))
##D 
##D #-- calendar time
##D modJoint.calendar <- frailtyPenal(Surv(t.start,t.stop,event)~cluster(id)+
##D sex+dukes+charlson+terminal(death),formula.terminalEvent=~sex+dukes+charlson,
##D data=readmission,n.knots=10,kappa=c(9.55e+9,1.41e+12),recurrentAG=TRUE)
##D 
##D #-- It takes around 1 minute to converge
##D 
##D summary(modJoint.gap)
##D summary(modJoint.calendar)
##D 
## End(Not run)





