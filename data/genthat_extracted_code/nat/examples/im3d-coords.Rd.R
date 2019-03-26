library(nat)


### Name: im3d-coords
### Title: Interconvert pixel and physical coordinates
### Aliases: im3d-coords xyzpos ijkpos

### ** Examples

# make an emty im3d
d=im3d(,dim=c(20,30,40),origin=c(10,20,30),voxdims=c(1,2,3))
# check round trip for origin
stopifnot(all.equal(ijkpos(d,xyzpos(d,c(1,1,1))), c(1,1,1)))



