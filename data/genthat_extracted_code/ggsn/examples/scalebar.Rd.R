library(ggsn)


### Name: scalebar
### Title: Scale bar
### Aliases: scalebar

### ** Examples

library(rgdal); library(broom)
dsn <- system.file('extdata', package = 'ggsn')

## Map in geographic coordinates.
map <- readOGR(dsn, 'sp')
map@data$id <- 1:nrow(map@data)
map.df <- merge(tidy(map), map, by = 'id')

ggplot(data = map.df, aes(long, lat, group = group, fill = nots)) +
    geom_polygon() +
    coord_equal() +
    geom_path() +
    scale_fill_brewer(name = 'Animal abuse\nnotifications', palette = 8) +
    scalebar(map.df, dist = 5, dd2km = TRUE, model = 'WGS84')




