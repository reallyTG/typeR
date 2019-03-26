library(secr)


### Name: stoatDNA
### Title: Stoat DNA Data
### Aliases: stoatDNA stoatCH stoat.model.EX stoat.model.HN stoat.model.HZ
### Keywords: datasets

### ** Examples

summary(stoatCH)

## Not run: 
##D stoat.model.HN <- secr.fit(stoatCH, buffer = 1000, detectfn = 0)
##D 
##D # this generates an error unless we use biasLimit = NA
##D # to suppress the default bias check
##D stoat.model.HZ <- secr.fit(stoatCH, buffer = 1000, detectfn = 1,
##D     biasLimit = NA)
##D 
##D stoat.model.EX <- secr.fit(stoatCH, buffer = 1000, detectfn = 2)
##D confint(stoat.model.HN, "D")
##D ## Profile likelihood interval(s)...
##D ##         lcl        ucl
##D ## D 0.01275125 0.04055662
## End(Not run)

## plot fitted detection functions
xv <- seq(0,800,10)
plot(stoat.model.EX, xval = xv, ylim = c(0,0.12), limits = FALSE,
    lty = 2)
plot(stoat.model.HN, xval = xv, limits = FALSE, lty = 1, add = TRUE)
plot(stoat.model.HZ, xval = xv, limits = FALSE, lty = 3, add = TRUE)

## review density estimates
collate(stoat.model.HZ, stoat.model.HN, stoat.model.EX,
    realnames = "D", perm = c(2,3,4,1))
## use secr:: in case of conflicting model.average from RMark
secr::model.average(stoat.model.HN, stoat.model.EX,
    realnames = "D")




