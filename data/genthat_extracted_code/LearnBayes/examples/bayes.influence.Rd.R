library(LearnBayes)


### Name: bayes.influence
### Title: Observation sensitivity analysis in beta-binomial model
### Aliases: bayes.influence
### Keywords: models

### ** Examples

data(cancermortality)
start=array(c(-7,6),c(1,2))
fit=laplace(betabinexch,start,cancermortality)
tpar=list(m=fit$mode,var=2*fit$var,df=4)
theta=sir(betabinexch,tpar,1000,cancermortality)
intervals=bayes.influence(theta,cancermortality)



