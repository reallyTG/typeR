library(merTools)


### Name: wiggle
### Title: Assign an observation to different values
### Aliases: wiggle

### ** Examples

data(iris)
wiggle(iris[3,], varlist = "Sepal.Width", valueslist = list(c(1, 2, 3, 5)))
wiggle(iris[3:5,], "Sepal.Width", valueslist = list(c(1, 2, 3, 5)))
wiggle(iris[3,], c("Sepal.Width", "Petal.Length"), list(c(1,2,3,5), c(3,5,6)))
wiggle(iris[3:5,], c("Sepal.Width", "Petal.Length"), list(c(1,2,3,5), c(3,5,6)))



