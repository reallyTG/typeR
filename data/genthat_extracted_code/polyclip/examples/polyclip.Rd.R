library(polyclip)


### Name: polyclip
### Title: Polygon Clipping
### Aliases: polyclip
### Keywords: spatial math

### ** Examples

  A <- list(list(x=1:10, y=c(1:5,5:1)))
  B <- list(list(x=c(2,8,8,2),y=c(0,0,10,10)))
  plot(c(0,10),c(0,10), type="n", axes=FALSE, xlab="", ylab="")
  polygon(A[[1]])
  polygon(B[[1]])
  C <- polyclip(A, B)
  polygon(C[[1]], lwd=3, col=3)



