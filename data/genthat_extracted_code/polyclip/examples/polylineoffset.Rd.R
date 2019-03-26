library(polyclip)


### Name: polylineoffset
### Title: Polygonal Line Offset
### Aliases: polylineoffset
### Keywords: spatial math

### ** Examples

  A <- list(list(x=c(4,8,8,2,6), y=c(3,3,8,8,6)))

  plot(c(0,10),c(0,10), type="n",
        main="jointype=square, endtype=opensquare", 
        axes=FALSE, xlab="", ylab="")
  lines(A[[1]], col="grey", lwd=3)
  C <- polylineoffset(A, 0.5, jointype="square", endtype="opensquare")
  polygon(C[[1]], lwd=3, border="blue")

  plot(c(0,10),c(0,10), type="n",
        main="jointype=round, endtype=openround", 
        axes=FALSE, xlab="", ylab="")
  lines(A[[1]], col="grey", lwd=3)
  C <- polylineoffset(A, 0.5, jointype="round", endtype="openround")
  polygon(C[[1]], lwd=3, border="blue")



