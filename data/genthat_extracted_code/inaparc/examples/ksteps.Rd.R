library(inaparc)


### Name: ksteps
### Title: Initialization of cluster prototypes using the centers of k
###   blocks
### Aliases: ksteps
### Keywords: cluster

### ** Examples

data(iris)
res <- ksteps(x=iris[,1:4], k=5)
v <- res$v
print(v)



