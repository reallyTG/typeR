library(pvclass)


### Name: cvpvs.knn
### Title: Cross-Validated P-Values (k Nearest Neighbors)
### Aliases: cvpvs.knn
### Keywords: classif

### ** Examples

X <- iris[, 1:4]
Y <- iris[, 5]

cvpvs.knn(X, Y, k = c(5, 10, 15))



