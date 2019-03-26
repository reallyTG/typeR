library(weathercan)


### Name: stations_search
### Title: Search for stations by name or location
### Aliases: stations_search

### ** Examples


stations_search(name = "Kamloops")
stations_search(name = "Kamloops", interval = "hour")

stations_search(coords = c(53.915495, -122.739379))

## No test: 
loc <- ggmap::geocode("Prince George, BC")
stations_search(coords = loc[c("lat", "lon")])
## End(No test)




