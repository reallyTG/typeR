library(spatstat)


### Name: rshift.ppp
### Title: Randomly Shift a Point Pattern
### Aliases: rshift.ppp
### Keywords: spatial datagen

### ** Examples

   data(amacrine)

   # random toroidal shift
   # shift "on" and "off" points separately
   X <- rshift(amacrine)

   # shift "on" points and leave "off" points fixed
   X <- rshift(amacrine, which="on")

   # shift all points simultaneously
   X <- rshift(amacrine, group=NULL)

   # maximum displacement distance 0.1 units
   X <- rshift(amacrine, radius=0.1)

   # shift with erosion
   X <- rshift(amacrine, radius=0.1, edge="erode")



