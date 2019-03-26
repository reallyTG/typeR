library(MixtureInf)


### Name: emtest.exp
### Title: test the order of a mixture of exponentials
### Aliases: emtest.exp
### Keywords: htest

### ** Examples

#generate a random sample from a 2 component exponential mixture,
#test for order = 2 by the EM-test,
#plot the histogram of the observations and the fitted density under the null model.
x <- rmix.exp(100,c(0.3,0.7),c(2,10))
out <- emtest.exp(x,2)
plotmix.exp(x,out)



