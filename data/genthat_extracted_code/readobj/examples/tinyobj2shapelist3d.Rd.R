library(readobj)


### Name: tinyobj2shapelist3d
### Title: Convert the raw tinyobjloader shapes/materials list into an rgl
###   shapelist3d
### Aliases: tinyobj2shapelist3d

### ** Examples

cube=read.obj(system.file("obj/cube.wavefront", package = "readobj"))
if(require("rgl")){
  cubesl=tinyobj2shapelist3d(cube)
  shade3d(cubesl)
}



