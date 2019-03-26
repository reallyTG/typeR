library(Rvcg)


### Name: vcgMetro
### Title: evaluate the difference between two triangular meshes.
### Aliases: vcgMetro

### ** Examples

require(Morpho)
data(humface)
data(dummyhead)
## align humface to dummyhead.mesh
humfalign <- rotmesh.onto(humface,humface.lm,dummyhead.lm)
samp <- vcgMetro(humfalign$mesh,dummyhead.mesh,faceSamp=FALSE,edgeSamp=FALSE)
## create heatmap using Morpho's meshDist function
## Not run: 
##D ## create custom heatmaps based on distances
##D mD <- meshDist(humfalign$mesh,distvec=samp$distances1)
## End(Not run)



