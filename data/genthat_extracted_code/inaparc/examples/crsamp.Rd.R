library(inaparc)


### Name: crsamp
### Title: Initialization of cluster prototypes using the centers of random
###   samples
### Aliases: crsamp
### Keywords: cluster

### ** Examples

data(iris)
# Prototypes are the objects nearest to the mean of
# five randomly sampled objects for each cluster
res <- crsamp(iris[,1:4], k=5, r=5, ctype="obj")
v <- res$v
print(v)



