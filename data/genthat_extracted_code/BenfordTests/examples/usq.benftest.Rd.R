library(BenfordTests)


### Name: usq.benftest
### Title: Freedman-Watson U-square Test for Benford's Law
### Aliases: usq.benftest
### Keywords: htest

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)
#Create a sample satisfying Benford's law
X<-rbenf(n=20)
#Perform Freedman-Watson U-squared Test on
#the sample's first digits using defaults
usq.benftest(X)
#p-value = 0.4847



