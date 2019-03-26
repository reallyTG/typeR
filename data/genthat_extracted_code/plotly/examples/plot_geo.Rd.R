library(plotly)


### Name: plot_geo
### Title: Initiate a plotly-geo object
### Aliases: plot_geo

### ** Examples


map_data("world", "canada") %>%
  group_by(group) %>%
  plot_geo(x = ~long, y = ~lat) %>%
  add_markers(size = I(1))




