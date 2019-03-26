library(mclust)


### Name: mclustModel
### Title: Best model based on BIC
### Aliases: mclustModel
### Keywords: cluster

### ** Examples

irisBIC <- mclustBIC(iris[,-5])
mclustModel(iris[,-5], irisBIC)
mclustModel(iris[,-5], irisBIC, G = 1:6, modelNames = c("VII", "VVI", "VVV"))



