library(simba)


### Name: hexgrid
### Title: Produces the nodes of an equidistant grid.
### Aliases: hexgrid
### Keywords: methods datagen

### ** Examples

## produces a grid with r=400:    
test.grd <- hexgrid(456000, 7356700, r=400)
## for plotting the following is recommended as it preserves 
## real positions:
library(geoR)
points.geodata(coords=test.grd[,3:4], data=rnorm(nrow(test.grd)))



