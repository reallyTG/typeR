library(pvclass)


### Name: pvs.knn
### Title: P-Values to Classify New Observations (k Nearest Neighbors)
### Aliases: pvs.knn
### Keywords: classif

### ** Examples

X <- iris[c(1:49, 51:99, 101:149), 1:4]
Y <- iris[c(1:49, 51:99, 101:149), 5]
NewX <- iris[c(50, 100, 150), 1:4]

pvs.knn(NewX, X, Y, k = c(5, 10, 15))



