library(inaparc)


### Name: kkz
### Title: Initialization of cluster prototypes using KKZ algorithm
### Aliases: kkz
### Keywords: cluster

### ** Examples

data(iris)
res <- kkz(x=iris[,1:4], k=5)
v <- res$v
print(v)



