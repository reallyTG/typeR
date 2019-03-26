library(bayesmeta)


### Name: Peto1980
### Title: Aspirin after myocardial infarction example data
### Aliases: Peto1980
### Keywords: datasets

### ** Examples

data("Peto1980")
## Not run: 
##D # compute effect sizes (log odds ratios) from count data
##D # (using "metafor" package's "escalc()" function):
##D require("metafor")
##D peto.es <- escalc(measure="OR",
##D                   ai=treat.events,   n1i=treat.cases,
##D                   ci=control.events, n2i=control.cases,
##D                   slab=publication, data=Peto1980)
##D print(peto.es)
##D 
##D # check sensitivity to different prior choices:
##D peto.ma01 <- bayesmeta(peto.es)
##D peto.ma02 <- bayesmeta(peto.es, tau.prior=function(t){dhalfnormal(t, scale=1)})
##D  
##D par(mfrow=c(2,1))
##D   plot(peto.ma01, which=4, prior=TRUE, taulim=c(0,1), main="uniform prior")
##D   plot(peto.ma02, which=4, prior=TRUE, taulim=c(0,1), main="half-normal prior")
##D par(mfrow=c(1,1))
##D 
##D # compare heterogeneity (tau) estimates:
##D print(rbind("uniform"    =peto.ma01$summary[,"tau"],
##D             "half-normal"=peto.ma02$summary[,"tau"]))
##D 
##D # compare effect (mu) estimates:
##D print(rbind("uniform"    =peto.ma01$summary[,"mu"],
##D             "half-normal"=peto.ma02$summary[,"mu"]))
##D 
##D summary(peto.ma02)
##D forestplot(peto.ma02)
##D plot(peto.ma02)
## End(Not run)



