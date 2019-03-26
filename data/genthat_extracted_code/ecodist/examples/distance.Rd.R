library(ecodist)


### Name: distance
### Title: Calculate dissimilarity/distance metrics
### Aliases: distance
### Keywords: multivariate

### ** Examples

data(iris)
iris.bc <- distance(iris[, 1:4], "bray-curtis")

# The effect of specifying icov:

# calculate Mahalanobis distance for the full iris dataset
iris.md <- full(distance(iris[, 1:4], "mahal"))
iris.md[1, 2] # Mahalanobis distance between samples 1 and 2 

# calculate Mahalanobis for just one species
setosa.md <- full(distance(iris[iris$Species == "setosa", 1:4], "mahal"))
setosa.md[1, 2] # Mahalanobis distance between samples 1 and 2 

# use the covariance matrix for the full dataset to scale for one species
setosa.scaled.md <- full(distance(iris[iris$Species == "setosa", 1:4],
  "mahal", icov=var(iris[,1:4])))
setosa.scaled.md[1, 2] # Mahalanobis distance between samples 1 and 2 




