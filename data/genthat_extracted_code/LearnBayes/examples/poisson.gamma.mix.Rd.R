library(LearnBayes)


### Name: poisson.gamma.mix
### Title: Computes the posterior for Poisson sampling and a mixture of
###   gammas prior
### Aliases: poisson.gamma.mix
### Keywords: models

### ** Examples

probs=c(.5, .5)
gamma.par1=c(1,1)
gamma.par2=c(10,2)
gammapar=rbind(gamma.par1,gamma.par2)
y=c(1,3,2,4,10); t=c(1,1,1,1,1)
data=list(y=y,t=t)
poisson.gamma.mix(probs,gammapar,data)


