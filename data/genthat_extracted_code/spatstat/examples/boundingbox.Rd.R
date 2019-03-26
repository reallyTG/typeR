library(spatstat)


### Name: boundingbox
### Title: Bounding Box of a Window, Image, or Point Pattern
### Aliases: boundingbox boundingbox.default boundingbox.im
###   boundingbox.owin boundingbox.ppp boundingbox.psp boundingbox.lpp
###   boundingbox.linnet boundingbox.solist
### Keywords: spatial utilities

### ** Examples

  w <- owin(c(0,10),c(0,10), poly=list(x=c(1,2,3,2,1), y=c(2,3,4,6,7)))
  r <- boundingbox(w)
  # returns rectangle [1,3] x [2,7]

  w2 <- unit.square()
  r <- boundingbox(w, w2)
  # returns rectangle [0,3] x [0,7]



