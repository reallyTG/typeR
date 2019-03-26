library(DGVM3D)


### Name: getEllipsoid
### Title: Calculate an ellipsoid
### Aliases: getEllipsoid

### ** Examples

if (require(rgl)) {
  ellipsoid=getEllipsoid(height=2)
  triangles3d(ellipsoid@vertices[ellipsoid@id, ], col="green")
} else {
  message("the library 'rgl' is required for this example!")
}



