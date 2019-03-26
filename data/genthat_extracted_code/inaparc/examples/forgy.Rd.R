library(inaparc)


### Name: forgy
### Title: Initialization of cluster prototypes using Forgy's algorithm
### Aliases: forgy
### Keywords: cluster

### ** Examples

data(iris)
res <- forgy(iris[,1:4], k=5)
v <- res$v
print(v)



