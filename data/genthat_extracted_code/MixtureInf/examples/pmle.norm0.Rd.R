library(MixtureInf)


### Name: pmle.norm0
### Title: compute the PMLE or MLE of the parameters under a mixture of
###   normals with equal and known variance
### Aliases: pmle.norm0
### Keywords: models

### ** Examples

#generate a random sample from a 2 component normal mixture,
#compute the PMLE of the parameters under the 2 component normal mixture model with 
#known variance 1.
x <- rmix.norm(200,c(0.3,0.7),c(-1,2))
pmle.norm0(x,var=1,2)



