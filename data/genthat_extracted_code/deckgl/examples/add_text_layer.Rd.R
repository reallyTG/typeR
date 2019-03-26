library(deckgl)


### Name: add_text_layer
### Title: Add a text layer to the deckgl widget
### Aliases: add_text_layer

### ** Examples

## @knitr text-layer
deck <- deckgl(zoom = 10, pitch = 35) %>%
  add_text_layer(
    data = bart_stations,
    pickable = TRUE,
    getPosition = get_position("lat", "lng"),
    getText = get_property("name"),
    getSize = 15,
    getAngle = 0,
    getTextAnchor = "middle",
    getAlignmentBaseline = "center",
    getTooltip = JS("object =>`${object.name}<br/>${object.address}`")
  ) %>%
  add_mapbox_basemap()

if (interactive()) deck



