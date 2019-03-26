library(predkmeans)


### Name: assignCluster
### Title: Make Cluster Assignments
### Aliases: assignCluster

### ** Examples

X <- matrix(rnorm(100*5), nrow=100, ncol=5)
centers <- matrix(runif(3*5), nrow=3, ncol=5)

cl <- assignCluster(X, centers)
table(cl)



