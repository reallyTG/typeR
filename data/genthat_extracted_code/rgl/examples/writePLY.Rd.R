library(rgl)


### Name: writePLY
### Title: Write Stanford PLY format files
### Aliases: writePLY
### Keywords: graphics

### ** Examples

filename <- tempfile(fileext = ".ply")
open3d()
shade3d( icosahedron3d(col = "magenta") )
writePLY(filename)



