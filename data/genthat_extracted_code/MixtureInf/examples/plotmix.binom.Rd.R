library(MixtureInf)


### Name: plotmix.binom
### Title: Histogram of the observations and the fitted probability mass
###   function of a mixture of binomials
### Aliases: plotmix.binom
### Keywords: dplot

### ** Examples

#generate a random sample from a 2 component binomial mixture,
#compute the PMLE of parameters based on the 2 component binomial mixture model,
#plot the histgoram of the observations and the fitted probability mass function.
x <- rmix.binom(200,c(0.3,0.7),c(0.4,0.6),50)
out <- pmle.binom(x,50,2)
plotmix.binom(x,50,out)



