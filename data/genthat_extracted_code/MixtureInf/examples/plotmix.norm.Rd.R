library(MixtureInf)


### Name: plotmix.norm
### Title: Histogram of the observations and the fitted density of a
###   mixture of normals with unequal variance
### Aliases: plotmix.norm
### Keywords: dplot

### ** Examples

#generate a random sample from a 2 component normal mixture,
#plot the histogram of the observations and the density function with a set of 
#given parameters.
x <- rmix.norm(200,c(0.3,0.7),c(2,5),c(1,2))
theta <- c(0.25,0.75,1.8,5.2,1.1,2.1)
plotmix.norm(x,theta)



