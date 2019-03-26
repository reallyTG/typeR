library(BLOQ)


### Name: imputeROS
### Title: imputing BLOQ's using regression on order statistics
### Aliases: imputeROS

### ** Examples

# generate data from Beal model with only fixed effects
set.seed(111)
genDataFixedEffects <- simulateBealModelFixedEffects(10, 0.693,
 		1, 1, seq(0.5,3,0.5))
imputeROS(genDataFixedEffects, 0.1)



