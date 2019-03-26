library(mclust)


### Name: unmap
### Title: Indicator Variables given Classification
### Aliases: unmap
### Keywords: cluster

### ** Examples

z <- unmap(iris[,5])
z[1:5, ]
  
emEst <- me(modelName = "VVV", data = iris[,-5], z = z)
emEst$z[1:5,]
  
map(emEst$z)



