library(rgl)


### Name: readSTL
### Title: Read and write STL (stereolithography) format files
### Aliases: readSTL writeSTL
### Keywords: graphics

### ** Examples

filename <- tempfile(fileext = ".stl")
open3d()
shade3d( icosahedron3d(col = "magenta") )
writeSTL(filename)
open3d()
readSTL(filename, col = "red")



