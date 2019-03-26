library(EMCluster)


### Name: Projection On 2D
### Title: Produce Projection on 2D
### Aliases: project.on.2d
### Keywords: utility

### ** Examples

## Not run: 
##D library(EMCluster, quietly = TRUE)
##D set.seed(1234)
##D 
##D ### Iris.
##D x <- as.matrix(iris[, 1:4])
##D ret <- init.EM(x, nclass = 3, min.n = 30)
##D ret.proj <- project.on.2d(x, ret)
##D 
##D ### Plot.
##D pdf("iris_ppcontour.pdf", height = 5, width = 5)
##D plotppcontour(ret.proj$da, ret.proj$Pi, ret.proj$Mu, ret.proj$S,
##D               ret.proj$class, main = "Iris K = 3")
##D dev.off()
## End(Not run)



