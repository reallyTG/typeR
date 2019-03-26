library(USAboundaries)


### Name: us_boundaries
### Title: Get historical or contemporary boundaries of the United States
### Aliases: us_boundaries

### ** Examples

if (require(USAboundariesData) && require(sf)) {
  map_states   <- us_boundaries("1850-07-04")
  map_counties <- us_boundaries(as.Date("1850-07-04"), type = "county")
  new_england <- c("Massachusetts", "Vermont", "New Hampshire", "Connecticut",
                   "Rhode Island", "Maine")
  map_ne <- us_boundaries("1943-02-12", states = new_england)
  map_congressional <- us_boundaries(type = "congressional",
                                   states = new_england)

  plot(st_geometry(map_states))
  plot(st_geometry(map_counties))
  plot(st_geometry(map_ne))
  plot(st_geometry(map_congressional))
}




