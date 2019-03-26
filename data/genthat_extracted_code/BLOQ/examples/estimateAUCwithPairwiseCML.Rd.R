library(BLOQ)


### Name: estimateAUCwithPairwiseCML
### Title: estimate AUCwith pairwise censored maximum likelihood
### Aliases: estimateAUCwithPairwiseCML

### ** Examples

# generate data from Beal model with only fixed effects
set.seed(111)
genDataFixedEffects <- simulateBealModelFixedEffects(10, 0.693,
		1, 1, seq(0.5,3,1.5))
estimateAUCwithPairwiseCML(genDataFixedEffects, 0.1, seq(0.5,3,1.5))



