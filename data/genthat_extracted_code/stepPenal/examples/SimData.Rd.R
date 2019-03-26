library(stepPenal)


### Name: SimData
### Title: Simulate data with normally distributed predictors and binary
###   response
### Aliases: SimData

### ** Examples

# simulate data with N=100 (sample size) and 23 predictors; 4 informative and 20 noise

set.seed(14)
beta    <- c(3, 2, -1.6, -4)
noise <- 5
N     <- 100
simData <- SimData(N=N, beta=beta, noise=noise, corr=FALSE)




