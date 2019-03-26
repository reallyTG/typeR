library(BLOQ)


### Name: imputeBLOQ
### Title: impute BLOQ's with various methods
### Aliases: imputeBLOQ

### ** Examples

set.seed(111)
inputData <- simulateBealModelFixedEffects(10, 0.693,1, 1, seq(0.5,3,0.5))
LOQ = 0.125
imputeBLOQ(inputData, LOQ, 
		imputationMethod = c("cml", "ros", "kernel","constant", "constant", "constant"), 
		maxIter = 500, isMultiplicative = TRUE, constantValue = LOQ)
imputeBLOQ(inputData, LOQ, maxIter = 500, isMultiplicative = TRUE, 
constantValue = LOQ/5, epsilon = 1e-04)



