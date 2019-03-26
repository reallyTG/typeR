library(RWeightedKmeans)


### Name: weightedKmeans
### Title: Weighted K-means Algorithm
### Aliases: weightedKmeans
### Keywords: kmeans weighted

### ** Examples

data("iris")

# Object weighting k-means algorithm
cl <- weightedKmeans(as.matrix(iris[,1:4]), 3, 50, FALSE, TRUE, "SIL")



