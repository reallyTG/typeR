library(RBesT)


### Name: automixfit
### Title: Automatic Fitting of Mixtures of Conjugate Distributions to a
###   Sample
### Aliases: automixfit

### ** Examples

# random sample of size 1000 from a mixture of 2 beta components
bm <- mixbeta(beta1=c(0.4, 20, 90), beta2=c(0.6, 35, 65))
bmSamp <- rmix(bm, 1000)

# fit with EM mixture models with up to 10 components and stop if
# AIC increases
bmFit <- automixfit(bmSamp, Nc=1:10, thresh=0, type="beta")
bmFit

# advanced usage: find out about all discarded models
bmFitAll <- attr(bmFit, "models")

sapply(bmFitAll, AIC, k=6)





