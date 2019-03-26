library(nsga2R)


### Name: crowdingDist4frnt
### Title: Crowding Distance Assignment for Each Front
### Aliases: crowdingDist4frnt

### ** Examples

library(mco)
popSize <- 50
lowerBounds <- rep(0,30)
upperBounds <- rep(1,30)
varNo <- length(lowerBounds)
objDim <- 2
set.seed(1234)
population <- t(sapply(1:popSize, function(u) array(runif(length(lowerBounds),
  lowerBounds,upperBounds))))
population <- cbind(population, t(apply(population,1,zdt2)))
ranking <- fastNonDominatedSorting(population[,(varNo+1):(varNo+objDim)])
rnkIndex <- integer(popSize)
i <- 1
while (i <= length(ranking)) {
  rnkIndex[ranking[[i]]] <- i
  i <- i + 1
} 
population <- cbind(population,rnkIndex)
objRange <- apply(population[,(varNo+1):(varNo+objDim)], 2, max) -
  apply(population[,(varNo+1):(varNo+objDim)], 2, min)
cd <- crowdingDist4frnt(population,ranking,objRange)
cd



