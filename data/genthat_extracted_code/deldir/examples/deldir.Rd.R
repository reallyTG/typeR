library(deldir)


### Name: deldir
### Title: Delaunay triangulation and Dirichlet tessellation
### Aliases: deldir
### Keywords: spatial

### ** Examples

x    <- c(2.3,3.0,7.0,1.0,3.0,8.0)
y    <- c(2.3,3.0,2.0,5.0,8.0,9.0)
# An "alerting note" is printed.; let deldir() choose the
# rectangular window.
dxy1 <- deldir(x,y)

# User chooses the rectangular window.
dxy2 <- deldir(x,y,rw=c(0,10,0,10))

# Put dummy points at the corners of the rectangular
# window, i.e. at (0,0), (10,0), (10,10), and (0,10)
dxy3 <- deldir(x,y,dpl=list(ndx=2,ndy=2),rw=c(0,10,0,10))

# Plot the triangulation created (but not the tesselation).
## Not run: 
##D dxy2 <- deldir(x,y,rw=c(0,10,0,10),plot=TRUE,wl='tr')
## End(Not run)

# Auxiliary values associated with points; 4 dummy points to be
# added so 4 dummy "z-values" provided.
z    <- c(1.63,0.79,2.84,1.56,0.22,1.07)
zdum <- rep(42,4)
dxy4 <- deldir(x,y,dpl=list(ndx=2,ndy=2),rw=c(0,10,0,10),z=z,zdum=zdum)



