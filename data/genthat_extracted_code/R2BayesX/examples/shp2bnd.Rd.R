library(R2BayesX)


### Name: shp2bnd
### Title: convert a shape-file into a boundary object
### Aliases: shp2bnd
### Keywords: spatial

### ** Examples

## read shapefile into bnd object
shpname <- file.path(find.package("R2BayesX"), "examples", "Northamerica")
north <- shp2bnd(shpname = shpname, regionnames = "COUNTRY")

## draw the map
plotmap(north)



