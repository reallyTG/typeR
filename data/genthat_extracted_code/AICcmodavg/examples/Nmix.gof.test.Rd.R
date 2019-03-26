library(AICcmodavg)


### Name: Nmix.gof.test
### Title: Compute Chi-square Goodness-of-fit Test for N-mixture Models
### Aliases: Nmix.chisq Nmix.chisq.default Nmix.chisq.unmarkedFitPCount
###   Nmix.chisq.unmarkedFitPCO Nmix.chisq.unmarkedFitMPois
###   Nmix.chisq.unmarkedFitDS Nmix.chisq.unmarkedFitGDS
###   Nmix.chisq.unmarkedFitGPC Nmix.chisq.unmarkedFitGMM Nmix.gof.test
###   Nmix.gof.test.default Nmix.gof.test.unmarkedFitPCount
###   Nmix.gof.test.unmarkedFitPCO Nmix.gof.test.unmarkedFitDS
###   Nmix.gof.test.unmarkedFitGDS Nmix.gof.test.unmarkedFitGMM
###   Nmix.gof.test.unmarkedFitGPC Nmix.gof.test.unmarkedFitMPois
###   print.Nmix.chisq
### Keywords: models

### ** Examples

##N-mixture model example modified from ?pcount
## Not run: 
##D require(unmarked)
##D ##single season
##D data(mallard)
##D mallardUMF <- unmarkedFramePCount(mallard.y, siteCovs = mallard.site,
##D                                   obsCovs = mallard.obs)
##D ##run model
##D fm.mallard <- pcount(~ ivel+ date + I(date^2) ~ length + elev + forest,
##D                      mallardUMF, K=30)
##D 
##D ##compute observed chi-square
##D obs <- Nmix.chisq(fm.mallard)
##D obs
##D 
##D ##round to 4 digits after decimal point
##D print(obs, digits.vals = 4)
##D 
##D ##compute observed chi-square, assess significance, and estimate c-hat
##D obs.boot <- Nmix.gof.test(fm.mallard, nsim = 10)
##D ##note that more bootstrap samples are recommended
##D ##(e.g., 1000, 5000, or 10 000)
##D obs.boot
##D print(obs.boot, digits.vals = 4, digits.chisq = 4)
##D detach(package:unmarked)
## End(Not run)



