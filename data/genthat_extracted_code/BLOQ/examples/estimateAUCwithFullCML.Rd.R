library(BLOQ)


### Name: estimateAUCwithFullCML
### Title: estimate AUC with Full censored maximum likelihood
### Aliases: estimateAUCwithFullCML

### ** Examples

#' # generate data from Beal model with only fixed effects
set.seed(123)
genDataFixedEffects <- simulateBealModelFixedEffects(10, 0.693,
	1, 1, seq(0.5,3,1.5))
estimateAUCwithFullCML(genDataFixedEffects, 0.15, seq(0.5,3,1.5))




