library(bayesmeta)


### Name: pppvalue
### Title: Posterior predictive p-values
### Aliases: pppvalue
### Keywords: htest

### ** Examples

## Not run: 
##D # perform a meta analysis;
##D # load data:
##D data("CrinsEtAl2014")
##D # compute effect sizes (log odds ratios) from count data
##D # (using "metafor" package's "escalc()" function):
##D require("metafor")
##D crins.srr <- escalc(measure="OR",
##D                     ai=exp.SRR.events,  n1i=exp.total,
##D                     ci=cont.SRR.events, n2i=cont.total,
##D                     slab=publication, data=CrinsEtAl2014, subset=c(1,4,6))
##D # analyze:
##D bma <- bayesmeta(crins.srr, mu.prior.mean=0, mu.prior.sd=4,
##D                  tau.prior=function(t){dhalfnormal(t, scale=0.5)})
##D 
##D # compute a 2-sided p-value for the effect (mu) parameter
##D # (note: this may take a while!):
##D p <- pppvalue(bma, parameter="mu", value=0, n=100)
##D 
##D # show result:
##D print(p)
##D 
##D # show the test statistic's distribution
##D # along with its actualized value:
##D plot(ecdf(p$replicates$statistic[,1]),
##D      xlim=range(c(p$statistic, p$replicates$statistic[,1])))
##D abline(v=p$statistic, col="red")
##D 
##D # show the parameter values
##D # drawn from the (conditional) posterior distribution:
##D plot(bma, which=2)
##D abline(h=p$null.value)                                # (the null-hypothesized mu value)
##D points(p$replicates$tau, p$replicates$mu, col="cyan") # (the samples)
##D 
##D ######################################################################
##D #  Among the 3 studies, only the first (Heffron, 2003) was randomized.
##D #  One might wonder about this particular study's effect (theta[1])
##D #  in the light of the additional evidence and compute a one-sided
##D #  p-value:
##D 
##D p <- pppvalue(bma, parameter="Heffron", value=0, n=100, alternative="less")
##D print(p)
##D 
##D ######################################################################
##D #  One may also define one's own 'test' statistic to be used.
##D #  For example, one could utilize the Bayes factor to generate
##D #  a p-value for the homogeneity (tau=0) hypothesis:
##D 
##D BF <- function(y, sigma)
##D {
##D   bm <- bayesmeta(y=y, sigma=sigma,
##D                   mu.prior.mean=0, mu.prior.sd=4,
##D                   tau.prior=function(t){dhalfnormal(t, scale=0.5)},
##D                   interval.type="central")
##D   # (central intervals are faster to compute;
##D   #  interval type otherwise is not relevant here)
##D   return(bm$bayesfactor[1,"tau=0"])
##D }
##D # NOTE: the 'bayesmeta()' arguments above should probably match
##D #       the specifications from the original analysis
##D 
##D p <- pppvalue(bma, parameter="tau", statistic=BF, value=0, n=100,
##D               alternative="greater", rejection.region="lower.tail",
##D               sigma=bma$sigma)
##D print(p)
##D 
##D ######################################################################
##D #  If one is only interested in generating samples (and not in test
##D #  statistics or p-values), one may specify the 'statistic' argument
##D #  as 'NA'.
##D #  Note that different 'parameter', 'value' and 'alternative' settings
##D #  imply different sampling schemes.
##D 
##D p <- pppvalue(bma, parameter="mu", statistic=NA, value=0,
##D               alternative="less", n=100)
##D 
##D plot(bma, which=2)
##D abline(h=p$null.value)
##D points(p$replicates$tau, p$replicates$mu, col="cyan")
## End(Not run)



