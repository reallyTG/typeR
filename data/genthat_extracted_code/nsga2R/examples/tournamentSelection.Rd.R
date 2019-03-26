library(nsga2R)


### Name: tournamentSelection
### Title: Tournament Selection
### Aliases: tournamentSelection

### ** Examples

library(mco)
tourSize <- popSize <- 10
lowerBounds <- rep(0,30)
upperBounds <- rep(1,30)
varNo <- length(lowerBounds)
objDim <- 2
set.seed(1234)
population <- t(sapply(1:popSize, function(u) array(runif(length(lowerBounds),
  lowerBounds,upperBounds))))
population <- cbind(population, t(apply(population,1,zdt3)))
ranking <- fastNonDominatedSorting(population[,(varNo+1):(varNo+objDim)])
rnkIndex <- integer(popSize)
i <- 1
while (i <= length(ranking)) {
  rnkIndex[ranking[[i]]] <- i
  i <- i + 1
} 
population <- cbind(population,rnkIndex);
objRange <- apply(population[,(varNo+1):(varNo+objDim)], 2, max) -
  apply(population[,(varNo+1):(varNo+objDim)], 2, min);
cd <- crowdingDist4frnt(population,ranking,objRange)
population <- cbind(population,apply(cd,1,sum))
matingPool <- tournamentSelection(population,popSize,tourSize)
matingPool



