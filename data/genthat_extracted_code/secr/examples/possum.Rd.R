library(secr)


### Name: possum
### Title: Brushtail Possum Trapping Dataset
### Aliases: possum possumCH possumarea possumremovalarea possummask
###   possum.model.0 possum.model.b possum.model.Ds
### Keywords: datasets

### ** Examples


plot(possummask)
plot(possumCH, tracks = TRUE, add = TRUE)
plot(traps(possumCH), add = TRUE)
lines(possumarea)
summary(possumCH)

## compare & average pre-fitted models
AIC(possum.model.0, possum.model.b, possum.model.Ds)
model.average(possum.model.0, possum.model.b, possum.model.Ds)

## Not run: 
##D 
##D ## Roughly estimate tag-loss error by dropping dubious histories
##D ## i.e. restrict to "not previously tagged"
##D NPT <- !covariates(possumCH)$prev.tagged
##D possum.model.0.NPT <- secr.fit(subset(possumCH,NPT), mask =
##D     possummask, trace = FALSE)
##D predict(possum.model.0)[1,2]/ predict(possum.model.0.NPT)[1,2]
##D ## ...about 9%
## End(Not run)




