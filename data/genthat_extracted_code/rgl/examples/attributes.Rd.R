library(rgl)


### Name: rgl.attrib
### Title: Get information about shapes
### Aliases: rgl.attrib
### Keywords: graphics

### ** Examples

p <- plot3d(rnorm(100), rnorm(100), rnorm(100), type = "s", col = "red")
rgl.attrib(p["data"], "vertices", last = 10)



