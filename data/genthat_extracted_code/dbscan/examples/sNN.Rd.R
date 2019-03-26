library(dbscan)


### Name: sNN
### Title: Shared Nearest Neighbors
### Aliases: sNN snn sort.sNN
### Keywords: model

### ** Examples

data(iris)
x <- iris[, -5]

# finding kNN and add the number of shared nearest neighbors.
k <- 5
nn <- sNN(x, k = k)
nn

# shared nearest neighbor distribution
table(as.vector(nn$shared))

# explore neighborhood of point 10
i <- 10
nn$shared[i,]

plot(nn, x)

# apply a threshold to create a sNN graph with edges
# if more than 3 neighbors are shared.
plot(sNN(nn, kt = 3), x)



