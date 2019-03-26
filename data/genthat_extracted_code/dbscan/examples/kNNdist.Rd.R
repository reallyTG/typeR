library(dbscan)


### Name: kNNdist
### Title: Calculate and plot the k-Nearest Neighbor Distance
### Aliases: kNNdist kNNdistplot
### Keywords: model plot

### ** Examples

data(iris)
iris <- as.matrix(iris[,1:4])

kNNdist(iris, k=4, search="kd")
kNNdistplot(iris, k=4)
## the knee is around a distance of .5

cl <- dbscan(iris, eps = .5, minPts = 4)
pairs(iris, col = cl$cluster+1L)
## Note: black are noise points



