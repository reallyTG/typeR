library(BLOQ)


### Name: imputeConstant
### Title: imputing BLOQ's with a constant value
### Aliases: imputeConstant

### ** Examples

# generate data from Beal model with only fixed effects
set.seed(111)
genDataFixedEffects <- simulateBealModelFixedEffects(10, 0.693,
		1, 1, seq(0.5,3,0.5))
# replacing BLOQ's with LOQ/2
imputeConstant(genDataFixedEffects, 0.1, 0.1/2)



