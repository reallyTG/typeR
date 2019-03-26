library(inaparc)


### Name: maximin
### Title: Initialization of cluster prototypes using Maximin algorithm
### Aliases: maximin
### Keywords: cluster

### ** Examples

data(iris)
res <-maximin(x=iris[,1:4], k=5)
v <- res$v
print(v)



