library(SiMRiv)


### Name: resistanceFromShape
### Title: Build resistance raster by combining shapefiles
### Aliases: resistanceFromShape

### ** Examples

## Example taken from the vignette; see the vignette
## for more details and examples.
## In this example we read a land cover shapefile and
## assign resistance values based on each polygon's
## land cover class (provided in the field 'coverclass')

landcover <- resistanceFromShape(
  system.file("doc/landcover.shp", package="SiMRiv")
  , res = 150, field = "coverclass", mapvalues = c(
    "forest" = 0.5, "urban" = 1, "dam" = 0
    , "shrubland" = 0.75), background = 0.95)
    
## We then combine it with a river network from another
## shapefile, assigning a value of 0 to all rivers

river.landcover <- resistanceFromShape(
  system.file("doc/river-sample.shp", package="SiMRiv")
  , baseRaster = landcover, buffer = 100, field = 0
  , background = 0.95, margin = 1000)

plot(river.landcover, axes = FALSE, mar = c(0, 0, 0, 2))




