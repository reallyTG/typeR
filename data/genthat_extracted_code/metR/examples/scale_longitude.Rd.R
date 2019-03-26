library(metR)


### Name: scale_longitude
### Title: Helpful scales for maps
### Aliases: scale_longitude scale_x_longitude scale_latitude
###   scale_y_longitude scale_x_latitude scale_y_latitude scale_x_level
###   scale_y_level

### ** Examples

data(geopotential)
library(ggplot2)
ggplot(geopotential[date == date[1]], aes(lon, lat, z = gh)) +
    geom_contour() +
    scale_x_longitude() +
    scale_y_latitude()




