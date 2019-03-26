library(MixtureInf)


### Name: rmix.binom
### Title: generate a random sample from a mixture of binomials
### Aliases: rmix.binom
### Keywords: datagen distribution

### ** Examples

#generate a random sample from a 2 component binomial mixture,
#plot the histogram of the data
x <- rmix.binom(200,c(0.3,0.7),c(0.4,0.6),20)
hist(x)



