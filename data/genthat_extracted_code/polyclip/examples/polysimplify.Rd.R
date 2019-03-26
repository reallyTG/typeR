library(polyclip)


### Name: polysimplify
### Title: Remove Self-Intersections from a Polygon
### Aliases: polysimplify
### Keywords: spatial manip

### ** Examples

  theta <- 2 * pi * (0:5) * 2/5

  A <- list(list(x=sin(theta), y=cos(theta)))
  B <- polysimplify(A, filltype="nonzero")

  opa <- par(mfrow=c(1,2))
  plot(c(-1,1),c(-1,1), type="n", axes=FALSE, xlab="", ylab="")
  with(A[[1]], segments(x[-6], y[-6], x[-1], y[-1], col="red"))
  points(A[[1]], col="red")

  with(A[[1]], text(x[1:5], y[1:5], labels=1:5, cex=2))
  plot(c(-1,1),c(-1,1), type="n", axes=FALSE, xlab="", ylab="")
  polygon(B[[1]], lwd=3, col="green")
  with(B[[1]], text(x,y,labels=seq_along(x), cex=2))
  par(opa)



