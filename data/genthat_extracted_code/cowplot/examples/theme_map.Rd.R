library(cowplot)


### Name: theme_map
### Title: Create a theme for map plotting
### Aliases: theme_map

### ** Examples

usa_data = map_data("usa")
ggplot(usa_data, aes(long, lat, group=region)) + geom_polygon() + theme_map()
ggplot(usa_data, aes(long, lat, fill = region)) + geom_polygon() + theme_map()
ggplot(usa_data, aes(long, lat, fill = region)) + facet_wrap(~region, scales = "free") +
  geom_polygon() + theme_map()



