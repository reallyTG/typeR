library(inaparc)


### Name: rsegment
### Title: Initialization of cluster prototypes using a randomly selected
###   segment
### Aliases: rsegment
### Keywords: cluster

### ** Examples

data(iris)
res <- rsegment(x=iris[,1:4], k=5)
v <- res$v
print(v)



