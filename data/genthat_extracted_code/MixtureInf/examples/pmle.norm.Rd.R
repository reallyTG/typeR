library(MixtureInf)


### Name: pmle.norm
### Title: compute the PMLE or MLE of the parameters under a mixture of
###   normals with unequal variance
### Aliases: pmle.norm
### Keywords: models

### ** Examples

#load the pearson's crab data,
#fit the 2 and 3 component normal mixture models,
#plot the histgorams of the observations and the fitted densities.
data(pearson)
out1 <- pmle.norm(pearson,2,1)
plotmix.norm(pearson,out1)

## Not run: 
##D out2 <- pmle.norm(pearson,3,1)
##D plotmix.norm(pearson,out2)
##D par(mfrow=c(1,1))
## End(Not run)



