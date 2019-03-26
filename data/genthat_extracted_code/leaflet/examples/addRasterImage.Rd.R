library(leaflet)


### Name: addRasterImage
### Title: Add a raster image as a layer
### Aliases: addRasterImage projectRasterForLeaflet

### ** Examples

## No test: 
library(raster)

r <- raster(xmn = -2.8, xmx = -2.79, ymn = 54.04, ymx = 54.05, nrows = 30, ncols = 30)
values(r) <- matrix(1:900, nrow(r), ncol(r), byrow = TRUE)
crs(r) <- CRS("+init=epsg:4326")

if (requireNamespace("rgdal")) {
  leaflet() %>% addTiles() %>%
    addRasterImage(r, colors = "Spectral", opacity = 0.8)
}
## End(No test)



