library(spatstat)


### Name: affine.tess
### Title: Apply Geometrical Transformation To Tessellation
### Aliases: reflect.tess flipxy.tess shift.tess rotate.tess
###   scalardilate.tess affine.tess
### Keywords: spatial math

### ** Examples

  live <- interactive()
  if(live) {
    H <- hextess(letterR, 0.2)
    plot(H)
    plot(reflect(H))
    plot(rotate(H, pi/3))
  } else H <- hextess(letterR, 0.6)

  # shear transformation
  shear <- matrix(c(1,0,0.6,1),2,2)
  sH <- affine(H, shear)
  if(live) plot(sH)



