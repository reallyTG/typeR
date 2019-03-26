library(frailtypack)


### Name: summary.additivePenal
### Title: summary of parameter estimates of an additive frailty model
### Aliases: summary.additivePenal print.summary.additivePenal
### Keywords: methods

### ** Examples



## Not run: 
##D 
##D data(dataAdditive)
##D 
##D modAdd <- additivePenal(Surv(t1,t2,event)~cluster(group)+var1+slope(var1),
##D correlation=TRUE,data=dataAdditive,n.knots=8,kappa=862,hazard="Splines")
##D 
##D #- 'var1' is boolean as a treatment variable.
##D 
##D summary(modAdd)
##D 
## End(Not run)





