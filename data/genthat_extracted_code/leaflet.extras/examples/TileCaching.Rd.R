library(leaflet.extras)


### Name: enableTileCaching
### Title: Enables caching of Tiles
### Aliases: enableTileCaching

### ** Examples

leaflet() %>%
  enableTileCaching() %>%
  addTiles(options = tileOptions(useCache = TRUE, crossOrigin = TRUE))

## for more examples see
# browseURL(system.file("examples/TileLayer-Caching.R", package = "leaflet.extras"))



