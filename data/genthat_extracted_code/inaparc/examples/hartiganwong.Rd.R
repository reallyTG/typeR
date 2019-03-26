library(inaparc)


### Name: hartiganwong
### Title: Initialization of cluster prototypes using Hartigan-Wong's
###   algorithm
### Aliases: hartiganwong
### Keywords: cluster

### ** Examples

data(iris)
res <- hartiganwong(iris[,1:4], k=5)
v <- res$v
print(v)



