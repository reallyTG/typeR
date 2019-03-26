library(condmixt)


### Name: hpareto.negloglike
### Title: Hybrid Pareto Maximum Likelihood Estimation
### Aliases: hpareto.negloglike hpareto.fit

### ** Examples

r <- rhpareto(500,0.2,trunc=FALSE)
params.init <- hpareto.mme(r)
hpareto.negloglike(params.init,r)
hpareto.fit(params.init,r)



