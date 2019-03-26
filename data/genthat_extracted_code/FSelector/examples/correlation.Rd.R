library(FSelector)


### Name: correlation
### Title: Correlation filter
### Aliases: linear.correlation rank.correlation

### ** Examples

  library(mlbench)
  data(BostonHousing)
  d=BostonHousing[-4] # only numeric variables
  
  weights <- linear.correlation(medv~., d)
  print(weights)
  subset <- cutoff.k(weights, 3)
  f <- as.simple.formula(subset, "medv")
  print(f)

  weights <- rank.correlation(medv~., d)
  print(weights)
  subset <- cutoff.k(weights, 3)
  f <- as.simple.formula(subset, "medv")
  print(f)



