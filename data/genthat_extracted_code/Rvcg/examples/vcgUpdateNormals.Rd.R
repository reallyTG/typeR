library(Rvcg)


### Name: vcgUpdateNormals
### Title: updates vertex normals of a triangular meshes or point clouds
### Aliases: vcgUpdateNormals

### ** Examples

data(humface)
humface$normals <- NULL # remove normals
humface <- vcgUpdateNormals(humface)
## Not run: 
##D pointcloud <- t(humface$vb[1:3,]) #get vertex coordinates
##D pointcloud <- vcgUpdateNormals(pointcloud)
##D 
##D require(Morpho)
##D plotNormals(pointcloud)#plot normals
## End(Not run)



