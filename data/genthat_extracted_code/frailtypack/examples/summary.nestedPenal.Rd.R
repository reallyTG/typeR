library(frailtypack)


### Name: summary.nestedPenal
### Title: summary of regression coefficient estimates of a nested frailty
###   model
### Aliases: summary.nestedPenal print.summary.nestedPenal
### Keywords: methods

### ** Examples



## Not run: 
##D 
##D data(dataNested)
##D 
##D modNested <- frailtyPenal(Surv(t1,t2,event)~cluster(group)+
##D subcluster(subgroup)+cov1+cov2,data=dataNested,
##D n.knots=8,kappa=c(50000,50000),hazard="Splines")
##D 
##D #- It takes 90 minutes to converge (depends on processor)
##D 
##D summary(modNested)
##D 
## End(Not run)





