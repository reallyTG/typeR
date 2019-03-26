library(BLOQ)


### Name: estimateAUCandStdErr
### Title: Estimate AUC and its standard error
### Aliases: estimateAUCandStdErr

### ** Examples

# generate data from Beal model with only fixed effects
set.seed(111)
genDataFixedEffects <- simulateBealModelFixedEffects(10, 0.693,
 		1, 1, seq(0.5,3,0.5))
# Impute the data with BLOQ's with one of the provided methods,
# for example, here we use ROS
imputedDataROS <- imputeROS(genDataFixedEffects, 0.1)
# estimate AUC and its standard error
estimateAUCandStdErr(imputedDataROS,seq(0.5,3,0.5))




