library(proxyC)


### Name: simil
### Title: Compute similiarty/distance between raws or columns of large
###   matrices
### Aliases: simil dist

### ** Examples

mt <- Matrix::rsparsematrix(100, 100, 0.01)
simil(mt, method = "cosine")[1:5, 1:5]
mt <- Matrix::rsparsematrix(100, 100, 0.01)
dist(mt, method = "euclidean")[1:5, 1:5]



