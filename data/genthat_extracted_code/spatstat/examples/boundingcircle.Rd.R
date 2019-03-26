library(spatstat)


### Name: boundingcircle
### Title: Smallest Enclosing Circle
### Aliases: boundingradius boundingradius.owin boundingradius.ppp
###   boundingcentre boundingcircle boundingcentre.owin boundingcircle.owin
###   boundingcentre.ppp boundingcircle.ppp
### Keywords: spatial math

### ** Examples

  boundingradius(letterR)

  plot(grow.rectangle(Frame(letterR), 0.2), main="", type="n")
  plot(letterR, add=TRUE, col="grey")
  plot(boundingcircle(letterR), add=TRUE, border="green", lwd=2)
  plot(boundingcentre(letterR), pch="+", cex=2, col="blue", add=TRUE)

  X <- runifpoint(5)
  plot(X)
  plot(boundingcircle(X), add=TRUE)
  plot(boundingcentre(X), pch="+", cex=2, col="blue", add=TRUE)



