library(SimInf)


### Name: distance_matrix
### Title: Create a distance matrix between nodes for spatial models
### Aliases: distance_matrix

### ** Examples

## Generate a grid 10 x 10 and place one node in each cell
## separated by 100m.
nodes <- expand.grid(x = (0:9) * 100, y = (0:9) * 100)
plot(y ~ x, nodes)

## Define the cutoff to only include neighbors within 300m.
d <- distance_matrix(x = nodes$x, y = nodes$y, cutoff = 301)

## View the first 10 rows and columns in the distance matrix
d[1:10, 1:10]



