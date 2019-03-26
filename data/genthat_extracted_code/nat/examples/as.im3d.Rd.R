library(nat)


### Name: as.im3d
### Title: Convert a suitable object to an im3d object.
### Aliases: as.im3d as.im3d.im3d as.im3d.matrix

### ** Examples

## convert a list of neurons into an image volume
im=as.im3d(xyzmatrix(kcs20), voxdims=c(1, 1, 1), 
  BoundingBox=c(250, 410, 0, 130, 0, 120))
## Not run: 
##D write.im3d(im, 'kc20volume.nrrd')
##D 
##D ## use image dimensions of an image on disk
##D # nb note use of ReadData = FALSE so that we just fetch the dimensions of
##D # the target image
##D diskim=read.im3d("/path/to/my/image.nrrd", ReadData = FALSE)
##D im=as.im3d(xyzmatrix(kcs20), diskim)
##D 
##D ## use image dimensions of JFRC2 template brain to define the image space
##D library(nat.flybrains)
##D im=as.im3d(xyzmatrix(kcs20), JFRC2)
## End(Not run)



