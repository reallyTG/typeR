library(nat)


### Name: smooth_neuron
### Title: Smooth the 3D coordinates of a neuron skeleton
### Aliases: smooth_neuron smooth_segment_gauss

### ** Examples

ns=smooth_neuron(Cell07PNs[[1]], sigma=2)
# plot in 2D zooming in on axon terminals 
plot(Cell07PNs[[1]], col='grey', xlim=c(260,290), ylim=c(115,90))
plot(ns, col='red', add=TRUE)
## No test: 
# 3D plot
plot3d(Cell07PNs[[1]], col='grey')
plot3d(ns, col='red')
## End(No test)



