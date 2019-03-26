library(brazilmaps)


### Name: plot_brmap
### Title: Facilitated plot of brazilian maps
### Aliases: plot_brmap

### ** Examples

## Plotting population estimates (2017) of the South Region
data("pop2017")
map_sul <- get_brmap(geo = "City", geo.filter = list(Region = 4))
mapa1 <- plot_brmap(map_sul,
                    data_to_join = pop2017,
                    join_by = c("City" = "mun"),
                    var = "pop2017")
mapa1

# Output is ggplot object so it can be extended
# with any number of ggplot layers
library(ggplot2)
mapa1 +
  labs(title = "População Municipal 2017 - Região Sul")


# Only displaying the microregions of the state of Sao Paulo
map_sp_micro <- get_brmap(geo = "MicroRegion",
                          geo.filter = list(State = 35),
                          class = "SpatialPolygonsDataFrame")
plot_brmap(map_sp_micro)




