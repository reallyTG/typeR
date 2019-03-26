library(nat)


### Name: plot3d.neuron
### Title: Plot neurons in 3D using rgl library
### Aliases: plot3d.neuron

### ** Examples

# A new plot would have been opened if required
open3d()
plot3d(Cell07PNs[[1]],col='red')
plot3d(Cell07PNs[[2]],col='green')
## No test: 
# clear the current plot
clear3d()
plot3d(Cell07PNs[[2]],col='blue',add=FALSE)
# plot the number of all nodes
clear3d()
plot3d(Cell07PNs[[2]],col='red',WithText=TRUE,add=FALSE)
# include cell bodies
plot3d(Cell07PNs[3:4], col='red', soma=TRUE)
plot3d(Cell07PNs[5], col='red', soma=3)
rgl.close()
## End(No test)



