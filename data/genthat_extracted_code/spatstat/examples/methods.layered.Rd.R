library(spatstat)


### Name: methods.layered
### Title: Methods for Layered Objects
### Aliases: methods.layered shift.layered reflect.layered flipxy.layered
###   rotate.layered affine.layered rescale.layered scalardilate.layered
### Keywords: spatial methods

### ** Examples

  L <- layered(letterR, runifpoint(20, letterR))
  plot(L)
  plot(rotate(L, pi/4))



