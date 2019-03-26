library(BLOQ)


### Name: estimateAUCwithCMLperTimePoint
### Title: estimate AUC with censored maximum likelihood per time point
### Aliases: estimateAUCwithCMLperTimePoint

### ** Examples

# generate data from Beal model with only fixed effects
set.seed(111)
genDataFixedEffects <- simulateBealModelFixedEffects(10, 0.693,
 		1, 1, seq(0.5,3,0.5))
# Multiplicative error model
estimateAUCwithCMLperTimePoint(genDataFixedEffects, 0.1, seq(0.5,3,0.5), TRUE)



