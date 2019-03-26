library(Rvcg)


### Name: vcgGetEdge
### Title: Get all edges of a triangular mesh
### Aliases: vcgGetEdge

### ** Examples

require(rgl)
data(humface)
edges <-vcgGetEdge(humface)
## Not run: 
##D ## show first edge
##D lines3d(t(humface$vb[1:3,])[c(edges$vert1[1],edges$vert2[2]),],col=2,lwd=3)
##D shade3d(humface, col=3)
##D ## now find the edge - hint: it is at the neck.
## End(Not run)



