library(leaflet)


### Name: addMapPane
### Title: Add additional panes to leaflet map to control layer order
### Aliases: addMapPane

### ** Examples

## No test: 
rand_lng <- function(n = 10) rnorm(n, -93.65, .01)
rand_lat <- function(n = 10) rnorm(n, 42.0285, .01)

random_data <- data.frame(
  lng = rand_lng(50),
  lat = rand_lat(50),
  radius = runif(50, 50, 150),
  circleId = paste0("circle #", 1:50),
  lineId = paste0("circle #", 1:50)
)

# display circles (zIndex: 420) above the lines (zIndex: 410), even when added first
leaflet() %>%
  addTiles() %>%
  # move the center to Snedecor Hall
  setView(-93.65, 42.0285, zoom = 14) %>%
  addMapPane("ames_lines", zIndex = 410) %>% # shown below ames_circles
  addMapPane("ames_circles", zIndex = 420) %>% # shown above ames_lines
  # points above polygons
  addCircles(
    data = random_data, ~lng, ~lat, radius = ~radius, popup = ~circleId,
    options = pathOptions(pane = "ames_circles")
  ) %>%
  # lines in 'ames_lines' pane
  addPolylines(
    data = random_data, ~lng, ~lat, color = "#F00", weight = 20,
    options = pathOptions(pane = "ames_lines")
  )


# same example but circles (zIndex: 420) are below the lines (zIndex: 430)
leaflet() %>%
  addTiles() %>%
  # move the center to Snedecor Hall
  setView(-93.65, 42.0285, zoom = 14) %>%
  addMapPane("ames_lines", zIndex = 430) %>% # shown below ames_circles
  addMapPane("ames_circles", zIndex = 420) %>% # shown above ames_lines
  # points above polygons
  addCircles(
    data = random_data, ~lng, ~lat, radius = ~radius, popup = ~circleId,
    options = pathOptions(pane = "ames_circles")
  ) %>%
  # lines in 'ames_lines' pane
  addPolylines(
    data = random_data, ~lng, ~lat, color = "#F00", weight = 20,
    options = pathOptions(pane = "ames_lines")
  )
## End(No test)



