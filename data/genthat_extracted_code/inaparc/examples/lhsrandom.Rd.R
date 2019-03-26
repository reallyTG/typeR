library(inaparc)


### Name: lhsrandom
### Title: Initialization of cluster prototypes using random LHS
### Aliases: lhsrandom
### Keywords: cluster

### ** Examples

data(iris)
res <- lhsrandom(iris[,1:4], k=5)
v <- res$v
print(v)



