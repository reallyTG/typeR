library(frailtypack)


### Name: plot.jointPenal
### Title: Plot Method for a Joint frailty model.
### Aliases: plot.jointPenal lines.jointPenal
### Keywords: methods

### ** Examples



## Not run: 
##D 
##D data(readmission)
##D 
##D #-- Gap-time
##D modJoint.gap <- frailtyPenal(Surv(time,event)~cluster(id)+sex+dukes+
##D charlson+terminal(death),formula.terminalEvent=~sex+dukes+charlson,
##D data=readmission,n.knots=14,kappa=c(100,100))
##D 
##D #-- It takes around 1 minute to converge --#
##D 
##D plot(modJoint.gap,type.plot="Haz",event="recurrent",conf.bands=TRUE)
##D plot(modJoint.gap,type.plot="Haz",event="terminal",conf.bands=TRUE)
##D plot(modJoint.gap,type.plot="Haz",event="both",conf.bands=TRUE)
##D 
##D plot(modJoint.gap,type.plot="Su",event="recurrent",conf.bands=TRUE)
##D plot(modJoint.gap,type.plot="Su",event="terminal",conf.bands=TRUE)
##D plot(modJoint.gap,type.plot="Su",event="both",conf.bands=TRUE)
##D 
##D 
## End(Not run)





