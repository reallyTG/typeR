library(apTreeshape)


### Name: plot.treeshape
### Title: Plot phylogenetic treeshapes.
### Aliases: plot.treeshape
### Keywords: hplot

### ** Examples


## Visual representation of the universal tree of life provided in data
data(universal.treeshape)
plot(universal.treeshape)

## Visual representation of two trees at the same time
data(carnivora.treeshape)
plot(carnivora.treeshape, cutreeshape(carnivora.treeshape, 8, "bottom"))



