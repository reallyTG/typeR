library(EMCluster)


### Name: Other Initializations
### Title: Other Initializations
### Aliases: starts.via.svd emgroup
### Keywords: programming

### ** Examples

library(EMCluster, quietly = TRUE)
set.seed(1234)
x1 <- da1$da

emobj <- emgroup(x1, nclass = 10)
summary(emobj)

ret.0 <- starts.via.svd(x1, nclass = 10, method = "kmeans")
summary(ret.0)



