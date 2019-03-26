library(ref.ICAR)


### Name: shape.H
### Title: Creating a Neighborhood Matrix for Areal Data from a Shapefile
### Aliases: shape.H

### ** Examples

#### Load extra libraries
library(sp)
library(rgdal)

### Read in a shapefile of the contiguous U.S. from package data
system.path <- system.file("extdata", "us.shape48.shp", package = "ref.ICAR", mustWork = TRUE)
shp.layer <- gsub('.shp','',basename(system.path))
shp.path <- dirname(system.path)
us.shape48 <- readOGR(dsn = path.expand(shp.path), layer = shp.layer, verbose = FALSE)

shp.data <- shape.H(system.path)
names(shp.data)



