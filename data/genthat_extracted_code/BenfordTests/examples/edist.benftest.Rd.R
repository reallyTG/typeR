library(BenfordTests)


### Name: edist.benftest
### Title: Euclidean Distance Test for Benford's Law
### Aliases: edist.benftest
### Keywords: htest

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)
#Create a sample satisfying Benford's law
X<-rbenf(n=20)
#Perform a Euclidean Distance Test on the
#sample's first digits using defaults
edist.benftest(X,pvalmethod ="simulate")
#p-value = 0.6085



