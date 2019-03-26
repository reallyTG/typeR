library(KernelKnn)


### Name: distMat.KernelKnn
### Title: kernel k-nearest-neighbors using a distance matrix
### Aliases: distMat.KernelKnn

### ** Examples


data(Boston)

X = Boston[, -ncol(Boston)]
y = Boston[, ncol(Boston)]

dist_obj = dist(X)

dist_mat = as.matrix(dist_obj)

out = distMat.KernelKnn(dist_mat, TEST_indices = NULL, y, k = 5, regression = TRUE)




