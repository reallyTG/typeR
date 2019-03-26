library(envlpaster)


### Name: fit.boot
### Title: fit.boot
### Aliases: fit.boot

### ** Examples

## Not run: 
##D set.seed(13)
##D library(envlpaster)
##D library(aster2)
##D data(simdata30nodes)
##D data <- simdata30nodes.asterdata
##D nnode <- length(vars)
##D xnew <- as.matrix(simdata30nodes[,c(1:nnode)])
##D m1 <- aster(xnew, root, pred, fam, modmat)
##D target <- 5:9
##D indices <- c(1,2,4,5)
##D u <- length(indices)
##D nboot <- 2000; timer <- nboot/2
##D bar <- eigenboot(m1, nboot = nboot, index = target, 
##D   u = u, vectors = indices, data = data, m = timer)
##D bar
## End(Not run)



