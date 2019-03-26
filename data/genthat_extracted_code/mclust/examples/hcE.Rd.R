library(mclust)


### Name: hcE
### Title: Model-based Hierarchical Clustering
### Aliases: hcE hcV hcEII hcVII hcEEE hcVVV
### Keywords: cluster

### ** Examples

hcTree <- hcEII(data = iris[,-5])
cl <- hclass(hcTree,c(2,3))

## Not run: 
##D par(pty = "s", mfrow = c(1,1))
##D clPairs(iris[,-5],cl=cl[,"2"])
##D clPairs(iris[,-5],cl=cl[,"3"])
##D 
##D par(mfrow = c(1,2))
##D dimens <- c(1,2)
##D coordProj(iris[,-5], classification=cl[,"2"], dimens=dimens)
##D coordProj(iris[,-5], classification=cl[,"3"], dimens=dimens)
## End(Not run)



