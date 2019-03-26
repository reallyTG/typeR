library(leaflet.opacity)


### Name: addHigherOpacity
### Title: Add higher opacity control to map
### Aliases: addHigherOpacity

### ** Examples

# Libraries
library(leaflet)
library(leaflet.opacity)
library(raster)

# Create artificial layer
r <- raster(xmn = -2.8, xmx = -2.79, ymn = 54.04, ymx = 54.05, nrows = 30, ncols = 30)
values(r) <- matrix(1:900, nrow(r), ncol(r), byrow = TRUE)
crs(r) <- CRS("+init=epsg:4326")

# Create leaflet map with higher opacity control
leaflet() %>%
  addTiles() %>%
  addRasterImage(r, layerId = "raster") %>%
  addHigherOpacity(layerId = "raster")



