library(mclust)


### Name: hc
### Title: Model-based Hierarchical Clustering
### Aliases: hc print.hc
### Keywords: cluster

### ** Examples

hcTree <- hc(modelName = "VVV", data = iris[,-5])
cl <- hclass(hcTree,c(2,3))

## Not run: 
##D par(pty = "s", mfrow = c(1,1))
##D clPairs(iris[,-5],cl=cl[,"2"])
##D clPairs(iris[,-5],cl=cl[,"3"])
##D 
##D par(mfrow = c(1,2))
##D dimens <- c(1,2)
##D coordProj(iris[,-5], dimens = dimens, classification=cl[,"2"])
##D coordProj(iris[,-5], dimens = dimens, classification=cl[,"3"])
## End(Not run)



