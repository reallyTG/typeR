library(BenfordTests)


### Name: mdist.benftest
### Title: Chebyshev Distance Test (maximum norm) for Benford's Law
### Aliases: mdist.benftest
### Keywords: htest

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)
#Create a sample satisfying Benford's law
X<-rbenf(n=20)
#Perform a Chebyshev Distance Test on the
#sample's first digits using defaults
mdist.benftest(X)
#p-value = 0.6421



