library(spatstat)


### Name: thinNetwork
### Title: Remove Vertices or Segments from a Linear Network
### Aliases: thinNetwork
### Keywords: spatial manip

### ** Examples

   L <- simplenet
   plot(L, main="thinNetwork(L, retainedges=c(-3, -5))")
   text(midpoints.psp(as.psp(L)), labels=1:nsegments(L), pos=3)
   Lsub <- thinNetwork(L, retainedges=c(-3, -5))
   plot(Lsub, add=TRUE, col="blue", lwd=2)



