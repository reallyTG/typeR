library(sads)


### Name: plotprofmle-methods
### Title: Log-likelihood profiles at original scale
### Aliases: plotprofmle plotprofmle,profile.mle2-method
###   plotprofmle,mle2-method likelregions likelregions,profile.mle2-method
###   likelregions,mle2-method

### ** Examples

birds.pln <- fitsad(birds, "lnorm")
birds.pln.p <- profile(birds.pln)
par(mfrow=c(1,2))
plotprofmle(birds.pln.p)
par(mfrow=c(1,1))
likelregions(birds.pln.p)
# Compare with the confidence intervals
confint(birds.pln.p)



