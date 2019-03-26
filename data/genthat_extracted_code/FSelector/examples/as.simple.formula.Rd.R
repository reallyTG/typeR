library(FSelector)


### Name: as.simple.formula
### Title: Converting to formulas
### Aliases: as.simple.formula

### ** Examples

  data(iris)
  result <- cfs(Species ~ ., iris)
  f <- as.simple.formula(result, "Species")



