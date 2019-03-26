library(FSelector)


### Name: relief
### Title: RReliefF filter
### Aliases: relief

### ** Examples

  data(iris)
  
  weights <- relief(Species~., iris, neighbours.count = 5, sample.size = 20)
  print(weights)
  subset <- cutoff.k(weights, 2)
  f <- as.simple.formula(subset, "Species")
  print(f)



