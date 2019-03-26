library(Rvcg)


### Name: vcgNonBorderEdge
### Title: Get all non-border edges
### Aliases: vcgNonBorderEdge

### ** Examples


data(humface)
edges <-vcgNonBorderEdge(humface)
## show first edge (not at the border)
## Not run: 
##D require(Morpho)
##D require(rgl)
##D lines3d(t(humface$vb[1:3,])[c(edges$vert1[1],edges$vert2[2]),],col=2,lwd=3)
##D 
##D ## plot barycenters of adjacent faces
##D bary <- barycenter(humface)
##D points3d(bary[c(edges$face1[1],edges$face2[1]),])
##D shade3d(humface, col=3)
##D ## now find the edge - hint: it is at the neck.
## End(Not run)



