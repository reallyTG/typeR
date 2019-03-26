library(inaparc)


### Name: lhsmaximin
### Title: Initialization of cluster prototypes using Maximin LHS
### Aliases: lhsmaximin
### Keywords: cluster

### ** Examples

data(iris)
res <- lhsmaximin(iris[,1:4], k=5)
v <- res$v
print(v)



