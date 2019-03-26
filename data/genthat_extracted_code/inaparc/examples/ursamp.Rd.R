library(inaparc)


### Name: ursamp
### Title: Initialization of cluster prototypes using random sampling on
###   each future
### Aliases: ursamp
### Keywords: cluster

### ** Examples

data(iris)
res <- ursamp(x=iris[,1:4], k=5)
v <- res$v
print(v)



