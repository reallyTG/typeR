library(EMCluster)


### Name: Plot Projection and Contour
### Title: Plot Contour
### Aliases: plotppcontour
### Keywords: utility

### ** Examples

## Not run: 
##D library(EMCluster, quietly = TRUE)
##D library(MASS, quietly = TRUE)
##D set.seed(1234)
##D 
##D ### Crabs.
##D x <- as.matrix(crabs[, 4:8])
##D ret <- init.EM(x, nclass = 4, min.n = 20)
##D ret.proj <- project.on.2d(x, ret)
##D 
##D ### Plot.
##D pdf("crabs_ppcontour.pdf", height = 5, width = 5)
##D plotppcontour(ret.proj$da, ret.proj$Pi, ret.proj$Mu, ret.proj$S,
##D               ret.proj$class, angle = pi/6, main = "Crabs K = 4")
##D dev.off()
## End(Not run)



