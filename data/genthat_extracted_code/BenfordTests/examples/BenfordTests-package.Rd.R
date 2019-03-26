library(BenfordTests)


### Name: BenfordTests-package
### Title: Statistical Tests for Benford's Law
### Aliases: BenfordTests-package BenfordTests
### Keywords: package distribution datagen htest manip

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)
#Create a sample satisfying Benford's law
X<-rbenf(n=20)
#Look at sample
X
#Look at the first digits of the sample
signifd(X)

#Perform a Chi-squared Test on the sample's first digits using defaults
chisq.benftest(X)
#p-value = 0.648



