library(deckgl)


### Name: add_data
### Title: Add JavaScript data file
### Aliases: add_data

### ** Examples

properties <- list(
  extruded = TRUE,
  cellSize = 200,
  elevationScale = 4,
  getPosition = get_position("lat", "lng")
)

deck <- deckgl(pitch = 45) %>%
  add_data(sf_bike_parking, "sfBikeParking") %>%
  add_grid_layer(
    data = get_data("sfBikeParking"),
    properties = properties
  )

if (interactive()) deck



