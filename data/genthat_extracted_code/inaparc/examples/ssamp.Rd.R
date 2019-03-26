library(inaparc)


### Name: ssamp
### Title: Initialization of cluster prototypes using systematic random
###   sampling
### Aliases: ssamp
### Keywords: cluster

### ** Examples

data(iris)
res <- ssamp(x=iris[,1:4], k=5)
v <- res$v
print(v)



