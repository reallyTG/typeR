library(bayesmeta)


### Name: CrinsEtAl2014
### Title: Pediatric liver transplant example data
### Aliases: CrinsEtAl2014
### Keywords: datasets

### ** Examples

data("CrinsEtAl2014")
## Not run: 
##D # compute effect sizes (log odds ratios) from count data
##D # (using "metafor" package's "escalc()" function):
##D require("metafor")
##D crins.es <- escalc(measure="OR",
##D                    ai=exp.AR.events,  n1i=exp.total,
##D                    ci=cont.AR.events, n2i=cont.total,
##D                    slab=publication, data=CrinsEtAl2014)
##D print(crins.es)
##D 
##D # analyze using weakly informative half-Cauchy prior for heterogeneity:
##D crins.ma <- bayesmeta(crins.es, tau.prior=function(t){dhalfcauchy(t,scale=1)})
##D 
##D # show results:
##D print(crins.ma)
##D forestplot(crins.ma)
##D plot(crins.ma)
##D 
##D # show heterogeneity posterior along with prior:
##D plot(crins.ma, which=4, prior=TRUE)
##D 
##D # perform meta analysis using 2 randomized studies only
##D # but use 4 non-randomized studies to inform heterogeneity prior:
##D crins.nrand <- bayesmeta(crins.es[crins.es$randomized=="no",],
##D                          tau.prior=function(t){dhalfcauchy(t,scale=1)})
##D crins.rand  <- bayesmeta(crins.es[crins.es$randomized=="yes",],
##D                          tau.prior=function(t){crins.nrand$dposterior(tau=t)})
##D plot(crins.nrand, which=4, prior=TRUE,
##D      main="non-randomized posterior = randomized prior")
##D plot(crins.rand, which=4, prior=TRUE, main="randomized posterior")
##D plot(crins.rand, which=1)
## End(Not run)



