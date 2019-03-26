library(HyperbolicDist)


### Name: momIntegrated
### Title: Moments Using Integration
### Aliases: momIntegrated
### Keywords: distribution univar

### ** Examples

### Calculate the mean of a generalized hyperbolic distribution
### Compare the use of integration and the formula for the mean
m1 <- momIntegrated("ghyp", param = c(1/2,3,1,1,0), order = 1, about = 0)
m1
ghypMean(c(1/2,3,1,1,0))
### The first moment about the mean should be zero
momIntegrated("ghyp", order = 1, param = c(1/2,3,1,1,0), about = m1)
### The variance can be calculated from the raw moments
m2 <- momIntegrated("ghyp", order = 2, param = c(1/2,3,1,1,0), about = 0)
m2
m2 - m1^2
### Compare with direct calculation using integration
momIntegrated("ghyp", order = 2, param = c(1/2,3,1,1,0), about = m1)
momIntegrated("generalized hyperbolic", param = c(1/2,3,1,1,0), order = 2,
              about = m1)
### Compare with use of the formula for the variance
ghypVar(c(1/2,3,1,1,0))



