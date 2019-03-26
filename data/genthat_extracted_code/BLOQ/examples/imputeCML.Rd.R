library(BLOQ)


### Name: imputeCML
### Title: imputing BLOQ's using censored maximum likelihood
### Aliases: imputeCML

### ** Examples

# generate data from Beal model with only fixed effects
set.seed(111)
genDataFixedEffects <- simulateBealModelFixedEffects(10, 0.693,
		1, 1, seq(0.5,3,0.5))
imputeCML(genDataFixedEffects, 0.1, FALSE, 1)



