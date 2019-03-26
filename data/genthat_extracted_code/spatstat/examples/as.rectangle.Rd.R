library(spatstat)


### Name: as.rectangle
### Title: Window Frame
### Aliases: as.rectangle
### Keywords: spatial manip

### ** Examples

  w <- owin(c(0,10),c(0,10), poly=list(x=c(1,2,3,2,1), y=c(2,3,4,6,7)))
  r <- as.rectangle(w)
  # returns a 10 x 10 rectangle

  data(lansing)
  as.rectangle(lansing)

  data(copper)
  as.rectangle(copper$SouthLines)



