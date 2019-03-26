library(RWeightedKmeans)


### Name: kmeans
### Title: Standard MacQueen K-means Algorithm
### Aliases: kmeans
### Keywords: kmeans

### ** Examples

data("iris")

# Classical k-means algorithm
cl <- kmeans(as.matrix(iris[,1:4]), 3, 100)



