library(BenfordTests)


### Name: chisq.benftest
### Title: Pearson's Chi-squared Goodness-of-Fit Test for Benford's Law
### Aliases: chisq.benftest
### Keywords: htest

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)
#Create a sample satisfying Benford's law
X<-rbenf(n=20)
#Perform a Chi-squared Test on the sample's 
#first digits using defaults but determine
#the p-value by simulation
chisq.benftest(X,pvalmethod ="simulate")
#p-value = 0.6401



