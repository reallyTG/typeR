library(BLOQ)


### Name: estimateAUCwithMVNCML
### Title: estimate AUC with multivariate normal censored maximum
###   likelihood
### Aliases: estimateAUCwithMVNCML

### ** Examples

# generate data from Beal model with only fixed effects
set.seed(111)
genDataFixedEffects <- simulateBealModelFixedEffects(10, 0.693,
		1, 1, seq(0.5,3,1.5))
estimateAUCwithMVNCML(genDataFixedEffects, 0.1, seq(0.5,3,1.5))
estimateAUCwithMVNCML(genDataFixedEffects, 0.1, seq(0.5,3,1.5),
isPairwise = TRUE)



