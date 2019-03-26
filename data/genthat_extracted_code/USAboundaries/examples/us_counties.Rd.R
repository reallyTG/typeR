library(USAboundaries)


### Name: us_counties
### Title: County boundaries (contemporary and historical)
### Aliases: us_counties

### ** Examples

if (require(USAboundariesData) && require(sf)) {
  contemporary_us  <- us_counties()
  historical_us    <- us_counties("1820-07-04")
  contemporary_ne  <- us_counties(states = c("Massachusetts", "Vermont", "Maine",
                                             "New Hampshire", "Rhode Island",
                                             "Connecticut"))
  historical_ne    <- us_counties("1803-04-28",
                                  states = c("Massachusetts", "Vermont", "Maine",
                                             "New Hampshire", "Rhode Island",
                                             "Connecticut"),
                                  resolution = "high")

  plot(st_geometry(contemporary_us))
  plot(st_geometry(historical_us))
  plot(st_geometry(contemporary_ne))
  plot(st_geometry(historical_ne))
}




