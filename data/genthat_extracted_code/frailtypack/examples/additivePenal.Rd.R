library(frailtypack)


### Name: additivePenal
### Title: Fit an Additive Frailty model using a semiparametric penalized
###   likelihood estimation or a parametric estimation
### Aliases: additivePenal
### Keywords: file

### ** Examples



## Not run: 
##D 
##D ###--- Additive model with 1 covariate ---###
##D 
##D data(dataAdditive)
##D 
##D modAdd <- additivePenal(Surv(t1,t2,event)~cluster(group)+
##D var1+slope(var1),correlation=TRUE,data=dataAdditive,
##D n.knots=8,kappa=10000)
##D 
##D #-- Var1 is boolean as a treatment variable
##D 
## End(Not run)





