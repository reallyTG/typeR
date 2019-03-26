library(DGVM3D)


### Name: getHexagon
### Title: Calculate a 3D hexagon
### Aliases: getHexagon

### ** Examples

if (require(rgl)) {
  hexagon <- getHexagon(area=dgvm3d.options("patch.area"), z=c(0, -2))
  triangles3d(hexagon@vertices[hexagon@id, ], col="brown")
} else {
  message("the library 'rgl' is required for this example!")
}



