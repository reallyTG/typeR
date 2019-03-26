library(spatstat)


### Name: as.data.frame.hyperframe
### Title: Coerce Hyperframe to Data Frame
### Aliases: as.data.frame.hyperframe
### Keywords: spatial manip

### ** Examples

  h <- hyperframe(X=1:3, Y=letters[1:3], f=list(sin, cos, tan))
  as.data.frame(h, discard=TRUE, warn=FALSE)
  as.data.frame(h, discard=FALSE)



