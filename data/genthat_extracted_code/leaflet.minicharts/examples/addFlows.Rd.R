library(leaflet.minicharts)


### Name: addFlows
### Title: Add or modify flows on a leaflet map
### Aliases: addFlows updateFlows removeFlows clearFlows

### ** Examples


require(leaflet)

# Toy example
leaflet() %>% addTiles() %>%
  addFlows(0, 0, 1, 1, flow = 10)

# Electric exchanges between France and neighbouring countries
data("eco2mixBalance")
bal <- eco2mixBalance
leaflet() %>% addTiles() %>%
  addFlows(
    bal$lng0, bal$lat0, bal$lng1, bal$lat1,
    flow = bal$balance,
    time = bal$month
  )





