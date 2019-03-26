library(geometry)


### Name: distmeshnd
### Title: A simple mesh generator for non-convex regions in n-D space
### Aliases: distmeshnd
### Keywords: dplot graphs math optimize

### ** Examples

## Not run: 
##D # examples distmeshnd
##D require(rgl)
##D 
##D fd = function(p, ...) sqrt((p^2)%*%c(1,1,1)) - 1
##D      # also predefined as `mesh.dsphere'
##D fh = function(p,...)  rep(1,nrow(p))
##D      # also predefined as `mesh.hunif'
##D bbox = matrix(c(-1,1),2,3)
##D p = distmeshnd(fd,fh,0.2,bbox, maxiter=100)
##D     # this may take a while:
##D     # press Esc to get result of current iteration
## End(Not run)



