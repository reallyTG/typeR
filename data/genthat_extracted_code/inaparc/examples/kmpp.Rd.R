library(inaparc)


### Name: kmpp
### Title: Initialization of cluster prototypes using K-means++ algorithm
### Aliases: kmpp
### Keywords: cluster

### ** Examples

data(iris)
res <- kmpp(x=iris[,1:4], k=5)
v <- res$v
print(v)



