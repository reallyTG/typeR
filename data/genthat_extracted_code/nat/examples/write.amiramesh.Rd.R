library(nat)


### Name: write.amiramesh
### Title: Write a 3D data object to an amiramesh format file
### Aliases: write.amiramesh

### ** Examples

d=array(rnorm(1000), c(10, 10, 10))
tf=tempfile(fileext='.am')
write.amiramesh(im3d(d, voxdims=c(0.5,0.5,1)), file=tf, WriteNrrdHeader=TRUE)
d2=read.nrrd(paste(tf, sep='', '.nhdr'))
all.equal(d, d2, tol=1e-6)



