library(LearnBayes)


### Name: binomial.beta.mix
### Title: Computes the posterior for binomial sampling and a mixture of
###   betas prior
### Aliases: binomial.beta.mix
### Keywords: models

### ** Examples

probs=c(.5, .5)
beta.par1=c(15,5)
beta.par2=c(10,10)
betapar=rbind(beta.par1,beta.par2)
data=c(20,15)
binomial.beta.mix(probs,betapar,data)



