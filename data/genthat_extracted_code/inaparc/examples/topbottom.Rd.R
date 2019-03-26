library(inaparc)


### Name: topbottom
### Title: Initialization of cluster prototypes using the top and bottom
###   objects
### Aliases: topbottom
### Keywords: cluster

### ** Examples

data(iris)
res <- topbottom(x=iris[,1:4], k=5)
v <- res$v
print(v)



