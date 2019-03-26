library(KernelKnn)


### Name: distMat.knn.index.dist
### Title: indices and distances of k-nearest-neighbors using a distance
###   matrix
### Aliases: distMat.knn.index.dist

### ** Examples


data(Boston)

X = Boston[, -ncol(Boston)]

dist_obj = dist(X)

dist_mat = as.matrix(dist_obj)

out = distMat.knn.index.dist(dist_mat, TEST_indices = NULL, k = 5)




