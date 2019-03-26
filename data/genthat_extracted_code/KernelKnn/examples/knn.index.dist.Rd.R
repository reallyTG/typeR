library(KernelKnn)


### Name: knn.index.dist
### Title: indices and distances of k-nearest-neighbors
### Aliases: knn.index.dist

### ** Examples


data(Boston)

X = Boston[, -ncol(Boston)]

out = knn.index.dist(X, TEST_data = NULL, k = 4, method = 'euclidean', threads = 1)




