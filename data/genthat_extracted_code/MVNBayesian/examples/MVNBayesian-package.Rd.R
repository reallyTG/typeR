library(MVNBayesian)


### Name: MVNBayesian-package
### Title: Bayesian Analysis Framework for MVN (Mixture) Distribution
### Aliases: MVNBayesian-package MVNBayesian
### Keywords: package Bayesian posteriori MVN distribution MVN mixture
###   distribution Gibbs sampling MCMC

### ** Examples

library(Rfast)
library(mvtnorm)
library(plyr)

head(dataset1)

BP <- MVN_BayesianPosteriori(dataset1)
BP

BP_Gibbs <- MVN_GibbsSampler(5000, BP)
colMeans(BP_Gibbs)
colrange(BP_Gibbs)

result <- MVN_MCMC(BP, 5000, c(1), c(77.03))
result$Accept



