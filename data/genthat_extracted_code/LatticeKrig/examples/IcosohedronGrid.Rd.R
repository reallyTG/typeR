library(LatticeKrig)


### Name: IcosohedronGrid
### Title: Icosoherdal multiresolution grids
### Aliases: IcosohedronGrid IcosohedronFaces
### Keywords: spatial

### ** Examples

# second level in lon lat coordinates 
look<- IcosohedronGrid(3)
lonlat<- toSphere( look[[3]])
plot( lonlat, xlab="lon", ylab="lat")



