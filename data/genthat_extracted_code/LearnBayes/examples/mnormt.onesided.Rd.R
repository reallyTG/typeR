library(LearnBayes)


### Name: mnormt.onesided
### Title: Bayesian test of one-sided hypothesis about a normal mean
### Aliases: mnormt.onesided
### Keywords: models

### ** Examples

y=c(182,172,173,176,176,180,173,174,179,175)
pop.s=3
data=c(mean(y),length(data),pop.s)
m0=175
normpar=c(170,1000)
mnormt.onesided(m0,normpar,data)



