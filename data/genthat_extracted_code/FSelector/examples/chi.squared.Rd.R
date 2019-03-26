library(FSelector)


### Name: chi.squared
### Title: Chi-squared filter
### Aliases: chi.squared

### ** Examples

  library(mlbench)
  data(HouseVotes84)

  weights <- chi.squared(Class~., HouseVotes84)
  print(weights)
  subset <- cutoff.k(weights, 5)
  f <- as.simple.formula(subset, "Class")
  print(f)



