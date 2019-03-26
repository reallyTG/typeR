library(MixtureInf)


### Name: plotmix.pois
### Title: Histogram of the observations and the fitted probability mass
###   function of a mixture of Poissons
### Aliases: plotmix.pois
### Keywords: dplot

### ** Examples

#generate a random sample from a 2 component Poisson mixture, 
#plot the histogram of the observations and the probability mass function with a set of 
#given parameters.
x <- rmix.pois(200,c(0.3,0.7),c(2,5))
theta <- c(0.25,0.75,1.8,5.2)
plotmix.pois(x,theta)



