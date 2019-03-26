library(FSelector)


### Name: random.forest.importance
### Title: RandomForest filter
### Aliases: random.forest.importance

### ** Examples

  library(mlbench)
  data(HouseVotes84)
  
  weights <- random.forest.importance(Class~., HouseVotes84, importance.type = 1)
  print(weights)
  subset <- cutoff.k(weights, 5)
  f <- as.simple.formula(subset, "Class")
  print(f)



