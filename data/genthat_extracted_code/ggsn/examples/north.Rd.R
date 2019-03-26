library(ggsn)


### Name: north
### Title: North symbol
### Aliases: north

### ** Examples

library(rgdal); library(broom)
dsn <- system.file('extdata', package = 'ggsn')
map <- readOGR(dsn, 'sp')
map@data$id <- 1:nrow(map@data)
map.df <- merge(tidy(map), map, by = 'id')

ggplot(map.df, aes(long, lat, group = group, fill = nots)) +
    geom_polygon() +
    coord_equal() +
    geom_path() +
    north(map.df) +
    scale_fill_brewer(name = 'Animal abuse\nnotifications', palette = 8)

ggplot(data = map.df, aes(long, lat, group = group, fill = nots)) +
    geom_polygon() +
    coord_equal() +
    geom_path() +
    north(map.df, location = 'bottomleft', symbol = 8) +
    scale_fill_brewer(name = 'Animal abuse\nnotifications', palette = 8)

ggplot(map.df, aes(long, lat, group = group, fill = nots)) +
    geom_polygon() +
    coord_equal() +
    geom_path() +
    north(data = map.df, location = 'bottomright', scale = 0.2, symbol = 14,
          anchor = c(x = -46.4, y = -23.9)) +
    scale_fill_brewer(name = 'Animal abuse\nnotifications', palette = 8)

## Not run: 
##D ggplot() +
##D    geom_polygon(data = map.df, aes(long, lat, group = group, fill = nots)) +
##D    coord_equal() +
##D    geom_path() +
##D    north(map.df)
## End(Not run)



