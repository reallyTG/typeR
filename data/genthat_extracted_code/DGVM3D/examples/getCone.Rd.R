library(DGVM3D)


### Name: getCone
### Title: calculate a cone
### Aliases: getCone

### ** Examples

if (require(rgl)) {
  cone=getCone(faces=13, close=TRUE)
  triangles3d(cone@vertices[cone@id, ], col="green")
} else {
  message("the library 'rgl' is required for this example!")
}



