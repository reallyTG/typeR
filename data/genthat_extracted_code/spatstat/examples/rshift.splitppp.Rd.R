library(spatstat)


### Name: rshift.splitppp
### Title: Randomly Shift a List of Point Patterns
### Aliases: rshift.splitppp
### Keywords: spatial datagen

### ** Examples

   data(amacrine)
   Y <- split(amacrine)

   # random toroidal shift
   # shift "on" and "off" points separately
   X <- rshift(Y)

   # shift "on" points and leave "off" points fixed
   X <- rshift(Y, which="on")

   # maximum displacement distance 0.1 units
   X <- rshift(Y, radius=0.1)

   # shift with erosion
   X <- rshift(Y, radius=0.1, edge="erode")



