library(frailtypack)


### Name: wts
### Title: Identify weights
### Aliases: wts
### Keywords: misc

### ** Examples



## Not run: 
##D 
##D data(dataNCC)
##D modJoint.ncc <- frailtyPenal(Surv(t.start,t.stop,event)~cluster(id)+cov1
##D +cov2+terminal(death)+wts(ncc.wts), formula.terminalEvent=~cov1+cov2,
##D data=dataNCC,n.knots=8,kappa=c(1.6e+10, 5.0e+03),recurrentAG=TRUE, RandDist="LogN") 
##D 
##D 
##D 
##D print(modJoint.ncc)
##D 
## End(Not run)





