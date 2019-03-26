library(BLOQ)


### Name: imputeKernelDensityEstimation
### Title: imputing BLOQ's using kernel density estimation
### Aliases: imputeKernelDensityEstimation

### ** Examples

# generate data from Beal model with only fixed effects
set.seed(111)
genDataFixedEffects <- simulateBealModelFixedEffects(10, 0.693,
		1, 1, seq(0.5,3,0.5))
imputeKernelDensityEstimation(genDataFixedEffects, 0.1, epsilon = 1e-05)



