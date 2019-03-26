library(fractal)


### Name: poincareMap
### Title: Create a Poincare map
### Aliases: poincareMap
### Keywords: univar models nonlinear

### ** Examples

## Using the third coordinate (\eqn{z} state) of a 
## chaotic Lorenz system, form a discrete map 
## using the series maxima. Embed the resulting 
## extrema in a 2-dimensional delay embedding 
## (with delay=1 for a map). The resulting plot 
## reveals a tent map structure common to 
## Poincare sections of chaotic flows. 
z <- poincareMap(lorenz[,3], extrema="max")
z <- embedSeries(z$amplitude, tlag=1, dimension=2)
plot(z, pch=1, cex=1)



