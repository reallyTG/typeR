library(spatstat)


### Name: affine.linnet
### Title: Apply Geometrical Transformations to a Linear Network
### Aliases: affine.linnet shift.linnet rotate.linnet rescale.linnet
###   scalardilate.linnet
### Keywords: spatial math

### ** Examples

  U <- rotate(simplenet, pi)
  stretch <- diag(c(2,3))
  Y <- affine(simplenet, mat=stretch)
  shear <- matrix(c(1,0,0.6,1),ncol=2, nrow=2)
  Z <- affine(simplenet, mat=shear, vec=c(0, 1))



