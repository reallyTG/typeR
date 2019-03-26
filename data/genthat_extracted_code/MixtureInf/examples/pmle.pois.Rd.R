library(MixtureInf)


### Name: pmle.pois
### Title: compute the PMLE or MLE of the parameters under a mixture of
###   Possions
### Aliases: pmle.pois
### Keywords: models

### ** Examples

#generate a random sample from a 2 component Poisson mixture,
#compute the PMLE of the parameters under the 2 component Poisson mixture model,
#plot the histgoram of the observations and the fitted probability mass function.
x <- rmix.pois(200,c(0.3,0.7),c(2,5))
out <- pmle.pois(x,2)
plotmix.pois(x,out)



