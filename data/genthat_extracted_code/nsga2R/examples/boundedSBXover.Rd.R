library(nsga2R)


### Name: boundedSBXover
### Title: Bounded Simulated Binary Crossover Operator
### Aliases: boundedSBXover

### ** Examples

set.seed(1234)
lowerBounds <- rep(0,30)
upperBounds <- rep(1,30)
cprob <- 0.7
XoverDistIdx <- 20
matingPool <- matrix(runif(1200, 0, 1), nrow=40, ncol=30)
childAfterX <- boundedSBXover(matingPool,lowerBounds,upperBounds,cprob,XoverDistIdx)
childAfterX



