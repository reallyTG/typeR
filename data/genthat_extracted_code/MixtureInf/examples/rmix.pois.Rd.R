library(MixtureInf)


### Name: rmix.pois
### Title: generate a random sample from a mixture of Possions
### Aliases: rmix.pois
### Keywords: datagen distribution

### ** Examples

#generate a random sample from a 2 component Poisson mixture,
#and compute the sample mean and variance.
x <- rmix.pois(200,c(0.3,0.7),c(2,5))
mean(x)
var(x)



