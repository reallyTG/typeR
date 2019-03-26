library(BenfordTests)


### Name: ks.benftest
### Title: Kolmogorov-Smirnov Test for Benford's Law
### Aliases: ks.benftest
### Keywords: htest

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)
#Create a sample satisfying Benford's law
X<-rbenf(n=20)
#Perform a Kolmogorov-Smirnov Test on the
#sample's first digits using defaults
ks.benftest(X)
#0.7483



