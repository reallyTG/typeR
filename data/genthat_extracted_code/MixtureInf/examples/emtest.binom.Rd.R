library(MixtureInf)


### Name: emtest.binom
### Title: test the order of a mixture of binomials
### Aliases: emtest.binom
### Keywords: htest

### ** Examples

#generate a random sample from a 2 component binomial mixture,
#test for order = 2 by the EM-test,
#plot the histogram of the observations and the fitted probability mass function 
#under the null model.
x <- rmix.binom(200,c(0.3,0.7),c(0.4,0.6),50)
out <- emtest.binom(x,50)
plotmix.binom(x,50,out)



