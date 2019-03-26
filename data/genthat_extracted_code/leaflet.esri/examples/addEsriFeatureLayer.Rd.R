library(leaflet.esri)


### Name: addEsriFeatureLayer
### Title: Adds an ArcGIS Feature Layer.
### Aliases: addEsriFeatureLayer

### ** Examples

leaflet() %>%
  addEsriBasemapLayer(esriBasemapLayers$Streets) %>%
  setView(-122.667, 45.526, 13) %>%
  addEsriFeatureLayer(
    url = paste0("https://services.arcgis.com/rOo16HdIMeOBI4Mb/arcgis/rest/services/",
                 "Heritage_Trees_Portland/FeatureServer/0"),
    useServiceSymbology = TRUE,
    labelProperty = "COMMON_NAM", labelOptions = labelOptions(textsize = "12px"),
  popupProperty = JS(paste0(
    "function(feature) {",
    "  return L.Util.template(",
    "    \"<h3>{COMMON_NAM}</h3><hr />",
    "      <p>This tree is located at {ADDRESS} and its scientific name is {SCIENTIFIC}.</p>",
    "    \",",
    "    feature.properties",
    "  );",
    "}"
  )))

## for more examples see
# browseURL(system.file("examples/featureLayers.R", package = "leaflet.esri"))
# browseURL(system.file("examples/multipleFeatureLayers.R", package = "leaflet.esri"))



