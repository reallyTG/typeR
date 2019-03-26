library(inaparc)


### Name: rsamp
### Title: Initialization of cluster prototypes using simple random
###   sampling
### Aliases: rsamp
### Keywords: cluster

### ** Examples

data(iris)
res <- rsamp(x=iris[,1:4], k=5)
v <- res$v
print(v)



