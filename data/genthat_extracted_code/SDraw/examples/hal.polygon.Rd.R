library(SDraw)


### Name: hal.polygon
### Title: Draws a Halton Lattice sample from an area (polygon) resource.
### Aliases: hal.polygon
### Keywords: design survey

### ** Examples


samp <- hal.polygon( WA, 100, J=c(4,3) )
plot(WA)
points( samp, pch=16, col="red" )
  
#   Different lattice topology
samp <- hal.polygon( WA, 100, J=c(8,2), eta=c(2,1), triangular=TRUE)
points( samp, pch=15, col="blue")
  




