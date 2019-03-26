library(readobj)


### Name: read.obj
### Title: Read a Wavefront OBJ 3D scene file into an R list
### Aliases: read.obj

### ** Examples

cube=read.obj(system.file("obj/cube.wavefront", package = "readobj"))
str(cube, max.level = 3)

# demonstrate direct conversion of result to rgl format
if(require('rgl')) {
  cuber=read.obj(system.file("obj/cube.wavefront", package = "readobj"),
    convert.rgl=TRUE)
  shade3d(cuber)
}



