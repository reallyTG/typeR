library(frailtypack)


### Name: plot.nestedPenal
### Title: Plot Method for a Nested frailty model and an Additive frailty
###   model.
### Aliases: plot.nestedPenal lines.nestedPenal plot.additivePenal
###   lines.additivePenal
### Keywords: methods

### ** Examples



## Not run: 
##D 
##D data(dataNested)
##D modNested <- frailtyPenal(Surv(t1,t2,event)~cluster(group)+
##D subcluster(subgroup)+cov1+cov2,data=dataNested,n.knots=8,
##D kappa=50000,hazard="Splines")
##D 
##D plot(modNested,conf.bands=FALSE)
##D 
##D data(dataAdditive)
##D 
##D modAdd <- additivePenal(Surv(t1,t2,event)~cluster(group)+var1+slope(var1),
##D correlation=TRUE,data=dataAdditive,n.knots=8,kappa=862,hazard="Splines")
##D 
##D #-- 'var1' is boolean as a treatment variable
##D 
##D plot(modAdd)
##D 
## End(Not run)





