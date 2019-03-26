library(MixtureInf)


### Name: pmle.exp
### Title: compute the PMLE or MLE of the parameters under a mixture of
###   exponentials
### Aliases: pmle.exp
### Keywords: models

### ** Examples

#generate a random sample from a 2 component exponential mixture,
#compute the PMLE of the parameters under 2 component exponential mixture model,
#plot the histgoram of the observations and the fitted density.
x <- rmix.exp(200,c(0.3,0.7),c(2,8))
out <- pmle.exp(x,2,1)
plotmix.exp(x,out)



