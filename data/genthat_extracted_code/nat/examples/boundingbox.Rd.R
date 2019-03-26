library(nat)


### Name: boundingbox
### Title: Get the bounding box of an im3d volume or other compatible
###   object
### Aliases: boundingbox boundingbox.im3d boundingbox.character
###   boundingbox.list boundingbox.neuron boundingbox.shape3d
###   boundingbox.default boundingbox<-

### ** Examples

boundingbox(c(x0=0,x1=10,y0=0,y1=20,z0=0,z1=30))
# bounding box for a neuron
boundingbox(Cell07PNs[[1]])



