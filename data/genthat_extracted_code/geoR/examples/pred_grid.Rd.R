library(geoR)


### Name: pred_grid
### Title: Generates a 2D Prediction Grid
### Aliases: pred_grid
### Keywords: spatial

### ** Examples

pred_grid(c(0,1), c(0,1), by=0.25) ## create a grid in a unit square
loc0 <- pred_grid(ca20$borders, by=20)
points(ca20, borders=borders)
points(loc0, pch="+")
points(locations.inside(loc0, ca20$border), pch="+", col=2)



