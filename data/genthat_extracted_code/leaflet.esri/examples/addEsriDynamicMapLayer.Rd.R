library(leaflet.esri)


### Name: addEsriDynamicMapLayer
### Title: Render and visualize Map Services from ArcGIS Online and ArcGIS
###   Server.
### Aliases: addEsriDynamicMapLayer

### ** Examples

popupFunc <- htmlwidgets::JS(
  "function (error, featureCollection) {
    if (error || featureCollection.features.length === 0) {
      return false;
    } else {
    return \"Risk Level: \" + featureCollection.features[0].properties.CLASS_DESC;
    }
  }")

leaflet() %>% setView(-96.8, 38.5, 4) %>%
  addEsriBasemapLayer(esriBasemapLayers$Gray, autoLabels = TRUE) %>%
  addEsriDynamicMapLayer(
    url = paste0("https://maps7.arcgisonline.com/arcgis/rest/services/",
                 "USDA_USFS_2014_Wildfire_Hazard_Potential/MapServer"),
    popupFunction = popupFunc)

## for more examples see
# browseURL(system.file("examples/dynamicMapLayers.R", package = "leaflet.esri"))



