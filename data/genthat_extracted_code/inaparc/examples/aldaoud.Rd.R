library(inaparc)


### Name: aldaoud
### Title: Initialization of cluster prototypes using Al-Daoud's algorithm
### Aliases: aldaoud
### Keywords: cluster

### ** Examples

data(iris)
res <- aldaoud(iris[,1:4], k=5)
v <- res$v
print(v)



