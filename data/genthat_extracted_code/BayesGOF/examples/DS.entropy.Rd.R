library(BayesGOF)


### Name: DS.entropy
### Title: Full and Excess Entropy of DS(G,m) prior
### Aliases: DS.entropy

### ** Examples

data(rat)
rat.start <- gMLE.bb(rat$y, rat$n)$estimate
rat.ds <- DS.prior(rat, max.m = 4, rat.start, family = "Binomial")
DS.entropy(rat.ds)



