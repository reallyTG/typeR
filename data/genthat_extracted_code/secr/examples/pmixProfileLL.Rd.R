library(secr)


### Name: pmixProfileLL
### Title: Mixture Model Check
### Aliases: pmixProfileLL
### Keywords: model

### ** Examples


## Not run: 
##D 
##D pmvals <- seq(0.02,0.99,0.02)
##D mask <- make.mask(traps(ovenCH[[1]]), nx = 32, buffer = 100)
##D ## only g0 ~ h2, so reduce pmi
##D outPL <- pmixProfileLL(ovenCH[[1]], model = list(g0~h2), mask
##D = mask, pmvals, CL = TRUE, ncores = 5, pmi = 4) ## slow!
##D plot(pmvals, outPL, xlim = c(0,1),
##D xlab = 'Fixed pmix', ylab = 'Profile log-likelihood')
##D 
## End(Not run)



