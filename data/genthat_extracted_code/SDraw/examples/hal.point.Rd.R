library(SDraw)


### Name: hal.point
### Title: Draws a Halton Lattice sample from a discrete (point) resource.
### Aliases: hal.point
### Keywords: design survey

### ** Examples


#   Draw sample of Hawaii coastline
#   This takes approximately 30 seconds to run
data(WA.cities)
samp <- hal.point( WA.cities, 100 )

#   Different lattice topology
samp <- hal.point( WA.cities, 100, J=c(10,4))
  




