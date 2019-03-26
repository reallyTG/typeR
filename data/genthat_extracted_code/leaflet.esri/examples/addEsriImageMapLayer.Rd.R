library(leaflet.esri)


### Name: addEsriImageMapLayer
### Title: Render and visualize Image Services from ArcGIS Online and
###   ArcGIS Server.
### Aliases: addEsriImageMapLayer

### ** Examples

leaflet() %>%
  addEsriBasemapLayer(esriBasemapLayers$Imagery) %>%
  setView(-120.23, 43.5, 5)  %>%
  addEsriImageMapLayer(
    url = paste0(
      "http://imagery.oregonexplorer.info/arcgis/rest/services/", 
      "NAIP_2011/NAIP_2011_Dynamic/ImageServer"
    ),
    options = imageMapLayerOptions(bandIds = c(3, 0, 1)))

## for more examples see
# browseURL(system.file("examples/imageMapLayers.R", package = "leaflet.esri"))



