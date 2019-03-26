library(TreeLS)


### Name: treePositions
### Title: Get unique tree positions from a _tree_map_
### Aliases: treePositions

### ** Examples

file = system.file("extdata", "model_boles.laz", package="TreeLS")
tls = readTLS(file)
plot(tls)

## build a 3D map of tree occurrences
map = treeMap(tls)
plot(map, color='Radii')

## get a 2D representation of the tree map
xymap = treePositions(map)
head(xymap)



