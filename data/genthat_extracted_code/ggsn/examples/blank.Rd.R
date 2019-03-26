library(ggsn)


### Name: blank
### Title: Blank theme
### Aliases: blank

### ** Examples

library(rgdal)
library(broom)
dsn <- system.file('extdata', package = 'ggsn')
map <- readOGR(dsn, 'sp')
map@data$id <- 0:(nrow(map@data) - 1)
map.df <- merge(tidy(map), map, by = 'id')

ggplot(map.df, aes(long, lat, group = group, fill = nots)) +
      geom_polygon() +
      coord_equal() +
      geom_path() +
      north(map.df) +
      blank()
      
ggplot(map.df, aes(long, lat, group = group, fill = nots)) +
      geom_polygon() +
      coord_equal() +
      geom_path() +
      north(map.df)



