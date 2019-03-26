library(bayesmeta)


### Name: GoralczykEtAl2011
### Title: Liver transplant example data
### Aliases: GoralczykEtAl2011
### Keywords: datasets

### ** Examples

data("GoralczykEtAl2011")
## Not run: 
##D # compute effect sizes (log odds ratios) from count data
##D # (using "metafor" package's "escalc()" function):
##D require("metafor")
##D goralczyk.es <- escalc(measure="OR",
##D                        ai=exp.AR.events,  n1i=exp.total,
##D                        ci=cont.AR.events, n2i=cont.total,
##D                        slab=publication, data=GoralczykEtAl2011)
##D print(goralczyk.es[,c(1,10,12,13,15,16,17)])
##D 
##D # analyze using weakly informative half-Cauchy prior for heterogeneity:
##D goralczyk.ma <- bayesmeta(goralczyk.es, tau.prior=function(t){dhalfcauchy(t,scale=1)})
##D 
##D # show summary:
##D print(goralczyk.ma)
##D 
##D # show forest plot:
##D forestplot(goralczyk.ma)
## End(Not run)



