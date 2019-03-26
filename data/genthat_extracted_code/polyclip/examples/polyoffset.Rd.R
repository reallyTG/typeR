library(polyclip)


### Name: polyoffset
### Title: Polygon Offset
### Aliases: polyoffset
### Keywords: spatial math

### ** Examples

  A <- list(list(x=c(4,8,8,2,6), y=c(3,3,8,8,6)))
  plot(c(0,10),c(0,10), type="n", main="jointype=square", axes=FALSE, xlab="", ylab="")
  polygon(A[[1]], col="grey")
  C <- polyoffset(A, 1, jointype="square")
  polygon(C[[1]], lwd=3, border="blue")
  plot(c(0,10),c(0,10), type="n", main="jointype=round", axes=FALSE, xlab="", ylab="")
  polygon(A[[1]], col="grey")
  C <- polyoffset(A, 1, jointype="round")
  polygon(C[[1]], lwd=3, border="blue")
  plot(c(0,10),c(0,10), type="n", main="jointype=miter", axes=FALSE, xlab="", ylab="")
  polygon(A[[1]], col="grey")
  C <- polyoffset(A, 1, jointype="miter")
  polygon(C[[1]], lwd=3, border="blue")



