library(kohonen)


### Name: expandMap
### Title: Expand a self-organising map
### Aliases: expandMap
### Keywords: classif

### ** Examples

data(yeast)
yeast.supersom <- supersom(yeast, somgrid(4, 4, "hexagonal"),
                           whatmap = 3:6, maxNA.fraction = .5)
yeast.supersom2 <- expandMap(yeast.supersom)
yeast.supersom3 <- supersom(yeast, yeast.supersom2$grid,
                            whatmap = 3:6, maxNA.fraction = .5,
                            init = yeast.supersom2$codes[3:6])



