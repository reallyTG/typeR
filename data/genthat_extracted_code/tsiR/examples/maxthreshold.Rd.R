library(tsiR)


### Name: maxthreshold
### Title: maxthreshold
### Aliases: maxthreshold

### ** Examples

require(kernlab)
Mold <- twentymeas[["Mold"]]
plotdata(Mold)
## Not run: 
##D parms <- estpars(data=Mold,alpha=0.97)
##D tau <- maxthreshold(data=Mold,parms=parms,
##D thresholdmin=8,thresholdmax=12,inits.fit=FALSE)
##D res <- simulatetsir(data=Mold,parms=parms,
##D epidemics='break',threshold=tau,method='negbin',inits.fit=FALSE)
##D plotres(res)
## End(Not run)



