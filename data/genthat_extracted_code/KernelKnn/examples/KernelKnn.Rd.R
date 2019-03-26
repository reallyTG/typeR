library(KernelKnn)


### Name: KernelKnn
### Title: kernel k-nearest-neighbors
### Aliases: KernelKnn

### ** Examples


data(Boston)

X = Boston[, -ncol(Boston)]
y = Boston[, ncol(Boston)]

out = KernelKnn(X, TEST_data = NULL, y, k = 5, method = 'euclidean', regression = TRUE)




