library(leaflet.extras)


### Name: pulseIconList
### Title: Make pulse-icon set
### Aliases: pulseIconList [.leaflet_pulse_icon_set makePulseIcon
###   pulseIcons addPulseMarkers

### ** Examples


iconSet = pulseIconList(
  red = makePulseIcon(color = "#ff0000"),
  blue = makePulseIcon(color = "#0000ff")
)

iconSet[c("red", "blue")]

leaflet() %>%
  addTiles() %>%
  addPulseMarkers(
    lng = -118.456554, lat = 34.078039,
    label = "This is a label",
    icon = makePulseIcon(heartbeat = 0.5)
  )


## for more examples see
# browseURL(system.file("examples/pluseIcon.R", package = "leaflet.extras"))



