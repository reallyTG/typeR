library(mclust)


### Name: map
### Title: Classification given Probabilities
### Aliases: map
### Keywords: cluster

### ** Examples

emEst <- me(modelName = "VVV", data = iris[,-5], z = unmap(iris[,5]))

map(emEst$z)



