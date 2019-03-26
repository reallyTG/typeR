library(hexbin)


### Name: grid.hexagons
### Title: Add Hexagon Cells to Plot
### Aliases: grid.hexagons
### Keywords: aplot

### ** Examples

set.seed(506)
x <- rnorm(10000)
y <- rnorm(10000)

# bin the points
bin <- hexbin(x,y)

# Typical approach uses plot( <hexbin> ) which controls the plot shape :
plot(bin, main = "Bivariate rnorm(10000)")

## but we can have more manual control:

# A mixture distribution
x <- c(rnorm(5000),rnorm(5000,4,1.5))
y <- c(rnorm(5000),rnorm(5000,2,3))
hb2 <- hexbin(x,y)

# Show color control and overplotting of hexagons
## 1) setup coordinate system:
P <- plot(hb2, type="n", main = "Bivariate mixture (10000)")# asp=1

## 2) add hexagons (in the proper viewport):
pushHexport(P$plot.vp)
grid.hexagons(hb2, style= "lattice", border = gray(.1), pen = gray(.6),
              minarea = .1, maxarea = 1.5)
library("grid")
popViewport()

## How to treat 'singletons' specially:
P <- plot(hb2, type="n", main = "Bivariate mixture (10000)")# asp=1
pushHexport(P$plot.vp)
grid.hexagons(hb2, style= "nested.centroids", mincnt = 2)# not the single ones
grid.hexagons(hb2, style= "centroids", maxcnt = 1, maxarea=0.04)# single points
popViewport()






