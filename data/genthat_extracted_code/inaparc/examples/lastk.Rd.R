library(inaparc)


### Name: lastk
### Title: Initialization of cluster prototypes using the last k objects
### Aliases: lastk
### Keywords: cluster

### ** Examples

data(iris)
res <- lastk(x=iris[,1:4], k=5)
v <- res$v
print(v)



