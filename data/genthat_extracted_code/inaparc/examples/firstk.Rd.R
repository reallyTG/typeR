library(inaparc)


### Name: firstk
### Title: Initialization of cluster prototypes using the first k objects
### Aliases: firstk
### Keywords: cluster

### ** Examples

data(iris)
res <- firstk(x=iris[,1:4], k=5)
v <- res$v
print(v)



