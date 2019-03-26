## ----echo = FALSE--------------------------------------------------------
example <- paste0(
  rprojroot::find_package_root_file(),
  "/inst/examples/deckgl-api-reference/icon-layer.R"
)
knitr::read_chunk(example)

## ----icon-layer, eval = FALSE--------------------------------------------
#  sample_data <- paste0(
#    "https://raw.githubusercontent.com/",
#    "uber-common/deck.gl-data/",
#    "master/website/bart-stations.json"
#  )
#  
#  properties <- list(
#    pickable = TRUE,
#    iconAtlas = encode_icon_atlas(),
#    iconMapping = list(marker = icon_definition()),
#    sizeScale = 10,
#    getPosition = get_property("coordinates"),
#    getIcon = JS("d => 'marker'"),
#    getSize = 5,
#    getColor = JS("d => [Math.sqrt(d.exits), 140, 0]"),
#    getTooltip = JS("object => `${object.name}<br/>${object.address}`")
#  )
#  
#  deck <- deckgl(zoom = 10, pitch = 45) %>%
#    add_icon_layer(data = sample_data, properties = properties) %>%
#    add_mapbox_basemap()
#  
#  if (interactive()) deck

