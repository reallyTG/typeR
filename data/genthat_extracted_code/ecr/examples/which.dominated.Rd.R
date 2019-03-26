library(ecr)


### Name: which.dominated
### Title: Determine which points of a set are (non)dominated.
### Aliases: which.dominated which.nondominated isMaximallyDominated
### Keywords: optimize

### ** Examples

  data(mtcars)
  # assume we want to maximize horsepower and minimize gas consumption
  cars = mtcars[, c("mpg", "hp")]
  cars$hp = -cars$hp
  idxs = which.nondominated(as.matrix(cars))
  print(mtcars[idxs, ])



