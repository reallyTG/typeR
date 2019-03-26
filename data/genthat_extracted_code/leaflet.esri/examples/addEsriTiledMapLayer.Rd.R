library(leaflet.esri)


### Name: addEsriTiledMapLayer
### Title: Access tiles from ArcGIS Online and ArcGIS Server to visualize
###   and identify features.
### Aliases: addEsriTiledMapLayer

### ** Examples

leaflet() %>% setView(-81.47, 30.70, 12) %>%
  addEsriTiledMapLayer(
    url = "https://services.arcgisonline.com/ArcGIS/rest/services/USA_Topo_Maps/MapServer")

## for more examples see
# browseURL(system.file("examples/tiledMapLayers.R", package = "leaflet.esri"))



