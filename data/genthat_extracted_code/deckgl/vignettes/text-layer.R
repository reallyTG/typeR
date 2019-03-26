## ----echo = FALSE--------------------------------------------------------
example <- paste0(
  rprojroot::find_package_root_file(),
  "/inst/examples/deckgl-api-reference/text-layer.R"
)
knitr::read_chunk(example)

## ----text-layer, eval = FALSE--------------------------------------------
#  deck <- deckgl(zoom = 10, pitch = 35) %>%
#    add_text_layer(
#      data = bart_stations,
#      pickable = TRUE,
#      getPosition = get_position("lat", "lng"),
#      getText = get_property("name"),
#      getSize = 15,
#      getAngle = 0,
#      getTextAnchor = "middle",
#      getAlignmentBaseline = "center",
#      getTooltip = JS("object =>`${object.name}<br/>${object.address}`")
#    ) %>%
#    add_mapbox_basemap()
#  
#  if (interactive()) deck

