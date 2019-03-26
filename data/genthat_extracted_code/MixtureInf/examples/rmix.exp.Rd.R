library(MixtureInf)


### Name: rmix.exp
### Title: generate a random sample from a mixture of exponentials
### Aliases: rmix.exp
### Keywords: datagen distribution

### ** Examples

#generate a random sample from a 2 component exponential mixture,
#compute the sample mean and variance.
x <- rmix.exp(200,c(0.3,0.7),c(2,8))
mean(x)
var(x)



