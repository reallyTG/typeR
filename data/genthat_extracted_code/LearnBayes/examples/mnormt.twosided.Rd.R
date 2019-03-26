library(LearnBayes)


### Name: mnormt.twosided
### Title: Bayesian test of a two-sided hypothesis about a normal mean
### Aliases: mnormt.twosided
### Keywords: models

### ** Examples

m0=170
prob=.5
tau=c(.5,1,2,4,8)
samplesize=10
samplemean=176
popsd=3
data=c(samplemean,samplesize,popsd)
mnormt.twosided(m0,prob,tau,data)



