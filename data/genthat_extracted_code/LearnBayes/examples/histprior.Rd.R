library(LearnBayes)


### Name: histprior
### Title: Density function of a histogram distribution
### Aliases: histprior
### Keywords: models

### ** Examples

midpts=c(.1,.3,.5,.7,.9)
prob=c(.2,.2,.4,.1,.1)
p=seq(.01,.99,by=.01)
plot(p,histprior(p,midpts,prob),type="l")



