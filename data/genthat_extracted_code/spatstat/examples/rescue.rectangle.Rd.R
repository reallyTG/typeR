library(spatstat)


### Name: rescue.rectangle
### Title: Convert Window Back To Rectangle
### Aliases: rescue.rectangle
### Keywords: spatial manip

### ** Examples

  w <- owin(poly=list(x=c(0,1,1,0),y=c(0,0,1,1)))
  rw <- rescue.rectangle(w)

  w <- as.mask(unit.square())
  rw <- rescue.rectangle(w)



