library(bspec)


### Name: acf.bspec
### Title: Posterior autocovariances
### Aliases: acf.bspec acf.default acf plot.bspecACF print.bspecACF
###   is.bspecACF
### Keywords: ts

### ** Examples

lhspec1 <- bspec(lh)

# without any prior specifications,
# autocovariances are not finite:
print(acf(lhspec1))
str(acf(lhspec1))

# for given values of the spectral parameters,
# the autocovariances are fixed:
str(acf(lhspec1, spec=sample(lhspec1)))

# for all the prior degrees-of-freedom greater than one,
# the expected autocovariance is finite, its variance isn't:
lhspec2 <- bspec(lh, priordf=2, priorscale=0.6, intercept=FALSE)
print(acf(lhspec2))
str(acf(lhspec2))
plot(acf(lhspec2))



