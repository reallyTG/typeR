library(spatstat)


### Name: insertVertices
### Title: Insert New Vertices in a Linear Network
### Aliases: insertVertices
### Keywords: spatial manip

### ** Examples

   opa <- par(mfrow=c(1,3), mar=rep(0,4))
   simplenet

   plot(simplenet, main="")
   plot(vertices(simplenet), add=TRUE)

   # add two new vertices at specified local coordinates
   L <- insertVertices(simplenet, seg=c(3,7), tp=c(0.2, 0.5))
   L
   plot(L, main="")
   plot(vertices(L), add=TRUE)
   id <- attr(L, "id")
   id
   plot(vertices(L)[id], add=TRUE, pch=16)

   # add new vertices at three randomly-generated points
   X <- runiflpp(3, simplenet)
   LL <- insertVertices(simplenet, X)
   plot(LL, main="")
   plot(vertices(LL), add=TRUE)
   ii <- attr(LL, "id")
   plot(vertices(LL)[ii], add=TRUE, pch=16)
   par(opa)



