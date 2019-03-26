library(spatstat)


### Name: plot.tess
### Title: Plot a Tessellation
### Aliases: plot.tess
### Keywords: spatial hplot

### ** Examples

  Rect <- tess(xgrid=0:4,ygrid=0:4)
  Diri <- dirichlet(runifpoint(7))
  plot(Diri)
  plot(Rect, border="blue", lwd=2, lty=2)
  plot(Rect, do.col=TRUE, border="white")
  plot(Rect, do.col=TRUE, values=runif(16), border="white")
  B <- Rect[c(1, 2, 5, 7, 9)]
  plot(B, hatch=TRUE)
  plot(Diri, do.col=TRUE)
  plot(Diri, do.col=TRUE, do.labels=TRUE, labelargs=list(col="white"),
             ribbon=FALSE)
  v <- as.im(function(x,y){factor(round(5 * (x^2 + y^2)))}, W=owin())
  levels(v) <- letters[seq(length(levels(v)))]
  Img <- tess(image=v)
  plot(Img)
  plot(Img, col=rainbow(11), ribargs=list(las=1))
  a <- tile.areas(Diri)
  marks(Diri) <- data.frame(area=a, random=runif(7, max=max(a)))
  plot(Diri, do.col=TRUE, equal.ribbon=TRUE)



