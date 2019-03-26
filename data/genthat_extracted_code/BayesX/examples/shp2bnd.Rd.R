library(BayesX)


### Name: shp2bnd
### Title: convert a shape-file into a boundary object
### Aliases: shp2bnd
### Keywords: spatial

### ** Examples

## read shapefile into bnd object
shpName <- sub(pattern="(.*)\\.dbf", replacement="\\1",
               x=system.file("examples/northamerica_adm0.dbf",
                             package="BayesX")) 
north <- shp2bnd(shpname=shpName, regionnames="COUNTRY")

## draw the map
drawmap(map=north)

## compare with shipped bnd file
shippedBnd <- read.bnd(system.file("examples/northamerica.bnd", package="BayesX"))
stopifnot(all.equal(north, shippedBnd))



