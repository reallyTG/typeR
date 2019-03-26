library(polyclip)


### Name: polyminkowski
### Title: Minkowski Sum of Polygon with Path
### Aliases: polyminkowski
### Keywords: spatial manip

### ** Examples

  A <- list(list(x=c(-3,3,3,-3),y=c(-3,-3,3,3)))
  B <- list(list(x=c(-1,1,1,-1),y=c(-1,-1,1,1)))
  C <- polyminkowski(A, B)
  opa <- par(mfrow=c(1,3))
  rr <- c(-4, 4)
  plot(rr, rr, type="n", axes=FALSE, xlab="", ylab="", main="A")
  polygon(A[[1]], col="blue")
  plot(rr,rr, type="n", axes=FALSE, xlab="", ylab="", main="B")
  polygon(B[[1]], border="red", lwd=4)
  plot(rr,rr, type="n", axes=FALSE, xlab="", ylab="", main="A+B")
  polygon(C[[1]], col="green")
  polygon(C[[2]], col="white")
  par(opa)



