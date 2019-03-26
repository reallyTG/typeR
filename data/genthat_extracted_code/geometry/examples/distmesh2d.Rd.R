library(geometry)


### Name: distmesh2d
### Title: A simple mesh generator for non-convex regions
### Aliases: distmesh2d
### Keywords: dplot graphs math optimize

### ** Examples

# examples distmesh2d
fd <- function(p, ...) sqrt((p^2)%*%c(1,1)) - 1
     # also predefined as `mesh.dcircle'
fh <- function(p,...)  rep(1,nrow(p))
bbox <- matrix(c(-1,1,-1,1),2,2)
p <- distmesh2d(fd,fh,0.2,bbox, maxiter=100)
    # this may take a while:
    # press Esc to get result of current iteration

# example with non-convex region
fd <- function(p, ...) mesh.diff(p , mesh.drectangle, mesh.dcircle, radius=.3)
     # fd defines difference of square and circle

p <- distmesh2d(fd,fh,0.05,bbox,radius=0.3,maxiter=4)
p <- distmesh2d(fd,fh,0.05,bbox,radius=0.3, maxiter=10)
     # continue on previous mesh



