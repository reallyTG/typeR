library(kohonen)


### Name: object.distances
### Title: Calculate distances between object vectors in a SOM
### Aliases: object.distances
### Keywords: classif

### ** Examples

data(wines)
set.seed(7)
sommap <- supersom(list(measurements = scale(wines),
                        vintages = vintages),
                   grid = somgrid(6, 4, "hexagonal"))
obj.dists <- object.distances(sommap, type = "data")
code.dists <- object.distances(sommap, type = "codes")



