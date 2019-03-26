library(dbscan)


### Name: kNN
### Title: Find the k Nearest Neighbors
### Aliases: kNN knn sort.kNN
### Keywords: model

### ** Examples

data(iris)
x <- iris[, -5]

# finding kNN directly in data (using a kd-tree)
nn <- kNN(x, k=5)
nn

# explore neighborhood of point 10
i <- 10
nn$id[i,]
plot(x, col = ifelse(1:nrow(iris) %in% nn$id[i,], "red", "black"))

# Visualize the 5 nearest neighbors
plot(nn, x)

# Visualize a reduced 2-NN graph
plot(kNN(nn, k = 2), x)



