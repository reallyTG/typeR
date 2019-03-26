library(RcppHNSW)


### Name: hnsw_build
### Title: Build a nearest neighbor index
### Aliases: hnsw_build

### ** Examples

irism <- as.matrix(iris[, -5])
ann <- hnsw_build(irism)
iris_nn <- hnsw_search(irism, ann, k = 5)



