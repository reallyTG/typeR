library(spatstat)


### Name: connected.linnet
### Title: Connected Components of a Linear Network
### Aliases: connected.linnet
### Keywords: spatial manip

### ** Examples

   # remove some edges from a network to make it disconnected
   plot(simplenet, col="grey", main="", lty=2)
   A <- thinNetwork(simplenet, retainedges=-c(3,5))
   plot(A, add=TRUE, lwd=2)
   # find the connected components
   connected(A)
   cA <- connected(A, what="components")
   plot(cA[[1]], add=TRUE, col="green", lwd=2)
   plot(cA[[2]], add=TRUE, col="blue", lwd=2)



