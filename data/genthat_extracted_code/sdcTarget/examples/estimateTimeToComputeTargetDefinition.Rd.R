library(sdcTarget)


### Name: estimateTimeToComputeTargetDefinition
### Title: Estimate Time To Complete Calculation of Target Definition
### Aliases: estimateTimeToComputeTargetDefinition

### ** Examples

set.seed(256)
my.X <- data.frame(matrix(ifelse(runif(500)>.5, TRUE, FALSE), ncol = 5))
estimateTimeToComputeTargetDefinition(X = my.X)



