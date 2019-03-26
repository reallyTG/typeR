library(FSelector)


### Name: oneR
### Title: OneR algorithm
### Aliases: oneR

### ** Examples

  library(mlbench)
  data(HouseVotes84)
  
  weights <- oneR(Class~., HouseVotes84)
  print(weights)
  subset <- cutoff.k(weights, 5)
  f <- as.simple.formula(subset, "Class")
  print(f)



