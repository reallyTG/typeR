library(LatticeKrig)


### Name: directionCosines
### Title: Utility functions for spherical coordinate and projections.
### Aliases: directionCosines toSphere projectionSphere
### Keywords: ~kwd1 ~kwd2

### ** Examples

# 
# icosohedron:
 phi = (1 + sqrt(5))/2
  V = matrix(c(0, 1, phi, 0, 1, -phi, 0, -1, phi, 0, -1, -phi, 
        1, phi, 0, -1, phi, 0, 1, -phi, 0, -1, -phi, 0, phi, 
        0, 1, -phi, 0, 1, phi, 0, -1, -phi, 0, -1), 12, 3, byrow = TRUE)

# check : library( rgl); plot3d( V, size=10, col="red4" )
# as lon lat:
V2<- toSphere( V)
plot( V2)

# lon lat grid
 lGrid<- make.surface.grid(  list(x= seq( -10,10,, 10), y= seq( -20,20,,10)) )
 
 dGrid<- directionCosines( lGrid)
 pairs( dGrid)
 # also try:   library( rgl); plot3d(  dGrid)
 
 





