library(nat)


### Name: spine
### Title: Compute the longest path (aka spine or backbone) of a neuron
### Aliases: spine

### ** Examples

pn.spine=spine(Cell07PNs[[1]])
## No test: 
plot3d(Cell07PNs[[1]])
plot3d(pn.spine, lwd=4, col='black')
## End(No test)
# just extract length
spine(Cell07PNs[[1]], rval='length')
# same result since StartPoint is included in longest path
spine(Cell07PNs[[1]], rval='length', UseStartPoint=TRUE)

# extract everything but the spine
antispine=spine(Cell07PNs[[1]], invert=TRUE)
## No test: 
plot3d(Cell07PNs[[1]])
plot3d(antispine, lwd=4, col='red')
## End(No test)




