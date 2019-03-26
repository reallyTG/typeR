library(RcppHNSW)


### Name: hnsw_search
### Title: Search an HNSW nearest neighbor index
### Aliases: hnsw_search

### ** Examples

irism <- as.matrix(iris[, -5])
ann <- hnsw_build(irism)
iris_nn <- hnsw_search(irism, ann, k = 5)



