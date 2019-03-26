library(frailtypack)


### Name: hazard
### Title: Hazard function.
### Aliases: hazard

### ** Examples



## Not run: 
##D 
##D #-- a fit Shared
##D data(readmission)
##D fit.shared <- frailtyPenal(Surv(time,event)~dukes+cluster(id)+
##D strata(sex),n.knots=10,kappa=c(10000,10000),data=readmission)
##D 
##D #-- calling survival
##D hazard(20,fit.shared)
##D 
## End(Not run)





