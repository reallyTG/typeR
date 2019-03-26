library(brazilmaps)


### Name: get_brmap
### Title: Get Brazilian maps from different geographic levels
### Aliases: get_brmap
### Keywords: IBGE geographic levels shapefile spatial

### ** Examples

## Retrieving the map from the State of Rio de Janeiro
rio_map <- get_brmap(geo = "State",
                     geo.filter = list(State = 33),
                     class = "sf")
plot_brmap(rio_map)

## Obtaining the municipalities maps from Midwest Region
cities_map <- get_brmap(geo = "City",
                        geo.filter = list(Region = 5),
                        class = "sf")
plot_brmap(cities_map)




