library(bayesmeta)


### Name: RhodesEtAlPrior
### Title: Heterogeneity priors for continuous outcomes (standardized mean
###   differences) as proposed by Rhodes et al. (2015).
### Aliases: RhodesEtAlPrior RhodesEtAlParameters
### Keywords: distribution

### ** Examples

# determine prior distribution for a specific setting:
RP <- RhodesEtAlPrior("obstetric", "pharma", "placebo")
print(RP$parameters)
str(RP)
# a prior 95 percent interval for tau:
RP$qprior(c(0.025,0.975))

# the general (marginal) setting:
RP <- RhodesEtAlPrior()
print(RP$parameters)
str(RP)
# a prior 95 percent interval for tau:
RP$qprior(c(0.025,0.975))

## Not run: 
##D # load "metafor" package:
##D require("metafor")
##D # load data:
##D data("dat.normand1999")
##D # compute effect sizes (standardized mean differences):
##D es <- escalc(measure="SMD", m1i=m1i, sd1i=sd1i, n1i=n1i,
##D              m2i=m2i, sd2i=sd2i, n2i=n2i,
##D              slab=source, data=dat.normand1999)
##D 
##D # derive appropriate prior:
##D RP <- RhodesEtAlPrior("resource use", "non-pharma", "non-pharma")
##D # show (central) prior 95 percent interval:
##D RP$qprior(c(0.025, 0.975))
##D # show prior 95 percent upper limit:
##D RP$qprior(0.95)
##D 
##D # perform meta analysis:
##D bma <- bayesmeta(es, tau.prior=RP$dprior)
##D # show results:
##D print(bma)
##D plot(bma, which=4, prior=TRUE)
## End(Not run)



