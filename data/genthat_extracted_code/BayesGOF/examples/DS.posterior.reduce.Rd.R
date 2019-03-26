library(BayesGOF)


### Name: DS.posterior.reduce
### Title: Posterior Expectation and Modes of DS object
### Aliases: DS.posterior.reduce

### ** Examples

data(rat)
rat.start <- gMLE.bb(rat$y, rat$n)$estimate
rat.ds <- DS.prior(rat, max.m = 4, rat.start, family = "Binomial")
DS.posterior.reduce(rat.ds)



