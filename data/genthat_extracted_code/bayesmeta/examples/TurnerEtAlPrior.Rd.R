library(bayesmeta)


### Name: TurnerEtAlPrior
### Title: (Log-Normal) heterogeneity priors for binary outcomes as
###   proposed by Turner et al. (2015).
### Aliases: TurnerEtAlPrior TurnerEtAlParameters
### Keywords: distribution

### ** Examples

# load example data:
data("CrinsEtAl2014")

# determine corresponding prior parameters:
TP <- TurnerEtAlPrior("surgical", "pharma", "placebo / control")
print(TP)
# a prior 95 percent interval for tau:
TP$qprior(c(0.025,0.975))

## Not run: 
##D # compute effect sizes (log odds ratios) from count data
##D # (using "metafor" package's "escalc()" function):
##D crins.es <- escalc(measure="OR",
##D                    ai=exp.AR.events,  n1i=exp.total,
##D                    ci=cont.AR.events, n2i=cont.total,
##D                    slab=publication, data=CrinsEtAl2014)
##D print(crins.es)
##D 
##D # perform meta analysis:
##D crins.ma01 <- bayesmeta(crins.es, tau.prior=TP$dprior)
##D # for comparison perform analysis using weakly informative Cauchy prior:
##D crins.ma02 <- bayesmeta(crins.es, tau.prior=function(t){dhalfcauchy(t,scale=1)})
##D 
##D # show results:
##D print(crins.ma01)
##D print(crins.ma02)
##D # compare estimates; heterogeneity (tau):
##D rbind("Turner prior"=crins.ma01$summary[,"tau"], "Cauchy prior"=crins.ma02$summary[,"tau"])
##D # effect (mu):
##D rbind("Turner prior"=crins.ma01$summary[,"mu"], "Cauchy prior"=crins.ma02$summary[,"mu"])
##D 
##D # illustrate heterogeneity priors and posteriors:
##D par(mfcol=c(2,2))
##D   plot(crins.ma01, which=4, prior=TRUE, taulim=c(0,2),
##D        main="informative log-normal prior")
##D   plot(crins.ma02, which=4, prior=TRUE, taulim=c(0,2),
##D        main="weakly informative half-Cauchy prior")
##D   plot(crins.ma01, which=3, mulim=c(-3,0),
##D        main="informative log-normal prior")
##D   abline(v=0, lty=3)
##D   plot(crins.ma02, which=3, mulim=c(-3,0),
##D        main="weakly informative half-Cauchy prior")
##D   abline(v=0, lty=3)
##D par(mfrow=c(1,1))
##D 
##D # compare prior and posterior 95 percent upper limits for tau:
##D TP$qprior(0.95)
##D crins.ma01$qposterior(0.95)
##D qhalfcauchy(0.95)
##D crins.ma02$qposterior(0.95)
## End(Not run)



