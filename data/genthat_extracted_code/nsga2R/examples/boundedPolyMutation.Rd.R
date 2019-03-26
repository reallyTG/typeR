library(nsga2R)


### Name: boundedPolyMutation
### Title: Bounded Polynomial Mutation Operator
### Aliases: boundedPolyMutation

### ** Examples

set.seed(1234)
lowerBounds <- rep(0,30)
upperBounds <- rep(1,30)
mprob <- 0.2
MutDistIdx <- 20
matingPool <- matrix(runif(1200, 0, 1), nrow=40, ncol=30)
childAfterM <- boundedPolyMutation(matingPool,lowerBounds,upperBounds,mprob,MutDistIdx)
childAfterM



