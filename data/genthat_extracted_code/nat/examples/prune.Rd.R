library(nat)


### Name: prune
### Title: prune an object by removing points near (or far) from a target
###   object
### Aliases: prune prune.neuron prune.dotprops prune.neuronlist
###   prune.default

### ** Examples

## prune single neurons
## No test: 
plot3d(kcs20[[1]],col='blue')
plot3d(kcs20[[2]],col='red')
## End(No test)
# prune neuron 2 down to points that are close to neuron 1
neuron2_close=prune(kcs20[[2]], target=kcs20[[1]], maxdist=10)
## No test: 
plot3d(neuron2_close, col='cyan', lwd=3)
## End(No test)
neuron2_far=prune(kcs20[[2]], target=kcs20[[1]], maxdist=10, keep='far')
## No test: 
plot3d(neuron2_far, col='magenta', lwd=3)
## End(No test)

## Prune a neuron with a neuronlist
pruned=prune(kcs20[[11]], kcs20[setdiff(1:20, 11)], maxdist=8)
## No test: 
plot3d(pruned, col='red', lwd=3)
plot3d(kcs20[[11]], col='green', lwd=3)
plot3d(kcs20,col='grey')
## End(No test)



