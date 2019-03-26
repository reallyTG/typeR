library(quantspec)


### Name: LagEstimator-constructor
### Title: Create an instance of the 'LagEstimator' class.
### Aliases: LagEstimator-constructor lagEstimator
### Keywords: Constructors

### ** Examples

Y <- rnorm(100)
levels.1 <- c(0.1,0.5,0.9)
weight <- lagKernelWeight(W = WParzen,  bw = 10, K = length(Y))
lagOp <- clippedCov(Y,levels.1 = levels.1)
lagEst <- lagEstimator(lagOp, weight = weight)



