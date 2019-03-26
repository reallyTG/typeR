library(BenfordTests)


### Name: meandigit.benftest
### Title: Judge-Schechter Mean Deviation Test for Benford's Law
### Aliases: meandigit.benftest
### Keywords: htest

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)
#Create a sample satisfying Benford's law
X<-rbenf(n=20)
#Perform a Judge-Schechter Mean Deviation Test
#on the sample's first digits using defaults
meandigit.benftest(X)
#p-value = 0.1458



