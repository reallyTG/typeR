library(inaparc)


### Name: spaeth
### Title: Initialization of cluster prototypes using Spaeth's algorithm
### Aliases: spaeth
### Keywords: cluster

### ** Examples

data(iris)
res <- spaeth(iris[,1:4], k=5)
v <- res$v
print(v)



