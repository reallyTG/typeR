library(LearnBayes)


### Name: normpostpred
### Title: Posterior predictive simulation from Bayesian normal sampling
###   model
### Aliases: normpostpred
### Keywords: models

### ** Examples

# finds posterior predictive distribution of the min statistic of a future sample of size 15
data(darwin)
s=normpostsim(darwin$difference)
sample.size=15
sim.stats=normpostpred(s,sample.size,min)



