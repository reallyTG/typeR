library(mclust)


### Name: hclass
### Title: Classifications from Hierarchical Agglomeration
### Aliases: hclass
### Keywords: cluster

### ** Examples

hcTree <- hc(modelName="VVV", data = iris[,-5])
cl <- hclass(hcTree,c(2,3))

## Not run: 
##D par(pty = "s", mfrow = c(1,1))
##D clPairs(iris[,-5],cl=cl[,"2"])
##D clPairs(iris[,-5],cl=cl[,"3"])
## End(Not run)



