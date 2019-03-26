library(nat)


### Name: xyzmatrix
### Title: Get and assign coordinates for classes containing 3D vertex data
### Aliases: xyzmatrix xyzmatrix.default xyzmatrix.neuron
###   xyzmatrix.neuronlist xyzmatrix.dotprops xyzmatrix.hxsurf
###   xyzmatrix.igraph xyzmatrix.mesh3d xyzmatrix<- xyzmatrix<-.neuron
###   xyzmatrix<-.dotprops xyzmatrix<-.hxsurf xyzmatrix<-.igraph
###   xyzmatrix<-.shape3d xyzmatrix<-.neuronlist

### ** Examples

# see all available methods for different classes
methods('xyzmatrix')
# ... and for the assignment method
methods('xyzmatrix<-')
n=Cell07PNs[[1]]
xyzmatrix(n)<-xyzmatrix(n)
stopifnot(isTRUE(
  all.equal(xyzmatrix(n),xyzmatrix(Cell07PNs[[1]]))
))



