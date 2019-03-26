library(spatstat)


### Name: connected.lpp
### Title: Connected Components of a Point Pattern on a Linear Network
### Aliases: connected.lpp
### Keywords: spatial manip

### ** Examples

   ## behaviour like connected.ppp
   U <- runiflpp(20, simplenet)
   plot(connected(U, 0.15, dismantle=FALSE))

   ## behaviour like connected.owin
   ## remove some edges from a network to make it disconnected
   plot(simplenet, col="grey", main="", lty=2)
   A <- thinNetwork(simplenet, retainedges=-c(3,5))
   plot(A, add=TRUE, lwd=2)
   X <- runiflpp(10, A)
   ## find the connected components
   cX <- connected(X)
   plot(cX[[1]], add=TRUE, col="blue", lwd=2)



