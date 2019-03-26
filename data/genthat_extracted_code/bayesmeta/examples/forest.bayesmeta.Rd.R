library(bayesmeta)


### Name: forest.bayesmeta
### Title: Generate a forest plot for a 'bayesmeta' object (based on the
###   'metafor' package's plotting functions).
### Aliases: forest.bayesmeta
### Keywords: hplot

### ** Examples

data("CrinsEtAl2014")

## Not run: 
##D # compute effect sizes (log odds ratios) from count data
##D # (using "metafor" package's "escalc()" function):
##D require("metafor")
##D es.crins <- escalc(measure="OR",
##D                    ai=exp.AR.events,  n1i=exp.total,
##D                    ci=cont.AR.events, n2i=cont.total,
##D                    slab=publication, data=CrinsEtAl2014)
##D # derive a prior distribution for the heterogeneity:
##D tp.crins <- TurnerEtAlPrior("surgical", "pharma", "placebo / control")
##D # perform meta-analysis:
##D ma.crins <- bayesmeta(es.crins, tau.prior=tp.crins$dprior)
##D 
##D ########
##D # plot:
##D forest(ma.crins, xlab="log odds ratio")
##D 
##D forest(ma.crins, trans=exp, refline=1, xlab="odds ratio")
## End(Not run)



