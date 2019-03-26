library(ggplot2)


### Name: stat_sf_coordinates
### Title: Extract coordinates from 'sf' objects
### Aliases: stat_sf_coordinates StatSfCoordinates
### Keywords: datasets

### ** Examples

if (requireNamespace("sf", quietly = TRUE)) {
nc <- sf::st_read(system.file("shape/nc.shp", package="sf"))

ggplot(nc) +
  stat_sf_coordinates()

ggplot(nc) +
  geom_errorbarh(
    aes(geometry = geometry,
        xmin = stat(x) - 0.1,
        xmax = stat(x) + 0.1,
        y = stat(y),
        height = 0.04),
    stat = "sf_coordinates"
  )
}




