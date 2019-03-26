library(spatstat)


### Name: project2segment
### Title: Move Point To Nearest Line
### Aliases: project2segment
### Keywords: spatial math

### ** Examples

  X <- rstrat(square(1), 5)
  Y <- as.psp(matrix(runif(20), 5, 4), window=owin())
  plot(Y, lwd=3, col="green")
  plot(X, add=TRUE, col="red", pch=16)
  v <- project2segment(X,Y)
  Xproj <- v$Xproj
  plot(Xproj, add=TRUE, pch=16)
  arrows(X$x, X$y, Xproj$x, Xproj$y, angle=10, length=0.15, col="red")



