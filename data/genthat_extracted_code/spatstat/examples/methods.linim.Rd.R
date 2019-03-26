library(spatstat)


### Name: methods.linim
### Title: Methods for Images on a Linear Network
### Aliases: methods.linim as.im.linim as.data.frame.linim print.linim
###   summary.linim affine.linim scalardilate.linim shift.linim
### Keywords: spatial math

### ** Examples

   M <- as.mask.psp(as.psp(simplenet))
   Z <- as.im(function(x,y) {x-y}, W=M)
   X <- linim(simplenet, Z)
   ## ............  print basic details .........................
   X
   ## ............  print gory details  .........................
   summary(X)
   ## ...........................................................
   shift(X, c(1,1))
   scalardilate(X, 2)
   head(as.data.frame(X))



