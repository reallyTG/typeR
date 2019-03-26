library(nat)


### Name: plot3d.boundingbox
### Title: Plot a bounding box in 3D
### Aliases: plot3d.boundingbox

### ** Examples

# find the bounding box of all the neurons in a list
boundingbox(kcs20)
boundingbox(kcs20[1:3])
## No test: 
# plot those neurons
plot3d(kcs20)
# ... with their bounding box
plot3d(boundingbox(kcs20))

plot3d(kcs20)
# plot bounding box (in matching colours) for each neuron
# NB makes use of nlapply/neuronlist in slightly unsusual context - 
# plot3d.neuronlist can cope with lists containing anything with
# a valid plot3d method.
plot3d(nlapply(kcs20,boundingbox))
## End(No test)




