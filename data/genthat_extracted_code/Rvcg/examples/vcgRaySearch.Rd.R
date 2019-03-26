library(Rvcg)


### Name: vcgRaySearch
### Title: check if a mesh is intersected by a set of rays
### Aliases: vcgRaySearch

### ** Examples

data(humface)
#get normals of landmarks
lms <- vcgClost(humface.lm, humface)
# offset landmarks along their normals for a negative amount of -5mm
lms$vb[1:3,] <- lms$vb[1:3,]+lms$normals[1:3,]*-5
intersect <- vcgRaySearch(lms, humface)
## Not run: 
##D require(Morpho)
##D require(rgl)
##D spheres3d(vert2points(lms),radius=0.5,col=3)
##D plotNormals(lms,long=5)
##D spheres3d(vert2points(intersect),col=2) #plot intersections
##D wire3d(humface,col="white")#'
## End(Not run)




