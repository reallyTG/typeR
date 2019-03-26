library(TreeLS)


### Name: map.hough
### Title: Tree mapping algorithm: Hough Transform
### Aliases: map.hough

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



