library(frailtypack)


### Name: cluster
### Title: Identify clusters
### Aliases: cluster
### Keywords: misc

### ** Examples



## Not run: 
##D 
##D data(readmission)
##D modSha <- frailtyPenal(Surv(time,event)~as.factor(dukes)+cluster(id),
##D n.knots=10,kappa=10000,data=readmission,hazard="Splines")
##D 
##D print(modSha)
##D 
## End(Not run)





