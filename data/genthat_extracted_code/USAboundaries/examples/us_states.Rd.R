library(USAboundaries)


### Name: us_states
### Title: State boundaries (contemporary and historical)
### Aliases: us_states

### ** Examples

contemporary_us <- us_states()

if (require(USAboundariesData) && require(sf)) {
  historical_us   <- us_states("1820-07-04")
  contemporary_ne <- us_states(states = c("Massachusetts", "Vermont", "Maine",
                                          "New Hampshire", "Rhode Island",
                                          "Connecticut"))
  historical_ne   <- us_states(as.Date("1805-03-12"),
                               states = c("Massachusetts", "Vermont", "Maine",
                                          "New Hampshire", "Rhode Island",
                                          "Connecticut"),
                               resolution = "high")
   plot(st_geometry(contemporary_us))
   plot(st_geometry(historical_us))
   plot(st_geometry(contemporary_ne))
   plot(st_geometry(historical_ne))
}




