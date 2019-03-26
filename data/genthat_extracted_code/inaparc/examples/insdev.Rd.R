library(inaparc)


### Name: insdev
### Title: Initialization of cluster prototypes using Insdev algorithm
### Aliases: insdev
### Keywords: cluster

### ** Examples

data(iris)
res <- insdev(x=iris[,1:4], k=5)
v <- res$v
print(v)



