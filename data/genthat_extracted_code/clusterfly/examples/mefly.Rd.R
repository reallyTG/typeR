library(clusterfly)


### Name: mefly
### Title: Display model based clustering with mvn ellipses. Displays the
###   results of model based clustering with an ellipse drawn from the
###   multivariate normal model for each group.
### Aliases: mefly
### Keywords: cluster dynamic

### ** Examples

if(require("mclust")) {
eei <- me(modelName = "EEI", data = iris[,-5], z = unmap(iris[,5]))
vvv <- me(modelName = "VVV", data = iris[,-5], z = unmap(iris[,5]))
vvi <- me(modelName = "VVI", data = iris[,-5], z = unmap(iris[,5]))
mefly(eei, iris[,-5])
mefly(vvi, iris[,-5])
mefly(vvv, iris[,-5])
}



