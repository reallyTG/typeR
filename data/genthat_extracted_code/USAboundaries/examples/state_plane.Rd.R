library(USAboundaries)


### Name: state_plane
### Title: Projections from the State Plane Coordinate System
### Aliases: state_plane

### ** Examples

if (require(USAboundariesData)) {
  state_plane(state = "MA", type = "epsg")
  state_plane(state = "MA", type = "proj4")
  state_plane(state = "MA", plane_id = "island", type = "epsg")
  state_plane(state = "MA", plane_id = "island", type = "proj4")

  # Show the difference made by a state plane projection
  if (require(sf)) {
    va <- us_states(states = "VA", resolution = "high")
    plot(st_geometry(va), graticule = TRUE)
    va <- st_transform(va, state_plane("VA"))
    plot(st_geometry(va), graticule = TRUE)
  }
}




