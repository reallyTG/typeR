library(spatstat)


### Name: quadratcount
### Title: Quadrat counting for a point pattern
### Aliases: quadratcount quadratcount.ppp quadratcount.splitppp
### Keywords: spatial math

### ** Examples

 X <- runifpoint(50)
 quadratcount(X)
 quadratcount(X, 4, 5)
 quadratcount(X, xbreaks=c(0, 0.3, 1), ybreaks=c(0, 0.4, 0.8, 1))
 qX <-  quadratcount(X, 4, 5)

 # plotting:
 plot(X, pch="+")
 plot(qX, add=TRUE, col="red", cex=1.5, lty=2)

 # irregular window
 data(humberside)
 plot(humberside)
 qH <- quadratcount(humberside, 2, 3)
 plot(qH, add=TRUE, col="blue", cex=1.5, lwd=2)

 # multitype - split
 plot(quadratcount(split(humberside), 2, 3))
 
 # quadrats determined by tessellation:
 B <- dirichlet(runifpoint(6))
 qX <- quadratcount(X, tess=B)
 plot(X, pch="+")
 plot(qX, add=TRUE, col="red", cex=1.5, lty=2)



