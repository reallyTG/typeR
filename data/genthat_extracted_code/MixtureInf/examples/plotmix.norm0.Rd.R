library(MixtureInf)


### Name: plotmix.norm0
### Title: Histogram of the observations and the fitted density of a
###   mixture of normals with equal and known variance
### Aliases: plotmix.norm0
### Keywords: dplot

### ** Examples

#generate a random sample from a 2 component normal mixture,
#compute the PMLE of parameters under a 2 component normal mixture model,
#plot the histgoram of the observations and the fitted density function.
x <- rmix.norm(200,c(0.3,0.7),c(-2,3))
out <- pmle.norm0(x,var=1,2)
plotmix.norm0(x,var=1,out)



