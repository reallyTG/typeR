library(POUMM)


### Name: POUMM
### Title: The Phylogenetic (Ornstein-Uhlenbeck) Mixed Model
### Aliases: POUMM

### ** Examples

## Not run: 
##D # Please, read the package vignette for more detailed examples.
##D N <- 500
##D tr <- ape::rtree(N)
##D z <- rVNodesGivenTreePOUMM(tr, 0, 2, 3, 1, 1)[1:N]
##D fit <- POUMM(z, tr, spec = specifyPOUMM(nSamplesMCMC = 5e4))
##D plot(fit)
##D summary(fit)
##D AIC(fit)
##D BIC(fit)
##D coef(fit)
##D logLik(fit)
##D fitted(fit)
##D plot(resid(fit))
##D abline(h=0)
##D 
##D # fit PMM to the same data and do a likelihood ratio test
##D fitPMM <- POUMM(z, tr, spec = specifyPMM(nSamplesMCMC = 5e4))
##D lmtest::lrtest(fitPMM, fit)
## End(Not run)




