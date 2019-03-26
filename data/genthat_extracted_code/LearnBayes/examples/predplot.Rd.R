library(LearnBayes)


### Name: predplot
### Title: Plot of predictive distribution for binomial sampling with a
###   beta prior
### Aliases: predplot
### Keywords: models

### ** Examples

prior=c(3,10)  # proportion has a beta(3, 10) prior
n=20   # sample size
yobs=10  # observed number of successes
predplot(prior,n,yobs)



