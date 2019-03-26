library(ggsn)


### Name: north2
### Title: North symbol 2
### Aliases: north2

### ** Examples

library(rgdal); library(broom)
dsn <- system.file('extdata', package = 'ggsn')
map <- readOGR(dsn, 'sp')
map@data$id <- 0:(nrow(map@data) - 1)
map.df <- merge(tidy(map), map, by = 'id')

map2 <- ggplot(data = map.df, aes(long, lat, group = group, fill = nots)) +
    geom_polygon() +
    coord_equal() +
    geom_path() +
    scale_fill_brewer(name = 'Animal abuse\nnotifications', palette = 8)

north2(map2, .5, .5)



