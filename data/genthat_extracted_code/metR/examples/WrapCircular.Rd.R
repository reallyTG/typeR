library(metR)


### Name: WrapCircular
### Title: Wrap periodic data to any range
### Aliases: WrapCircular RepeatCircular

### ** Examples

library(ggplot2)
library(data.table)
data(geopotential)
g <- ggplot(geopotential[date == date[1]], aes(lon, lat)) +
    geom_contour(aes(z = gh)) +
    coord_polar() +
    ylim(c(-90, -10))

# This plot has problems in lon = 0
g

# But using WrapCircular solves it.
g %+% WrapCircular(geopotential[date == date[1]], "lon", c(0, 360))

# Aditionally data can be just repeatet to the right and
# left
ggplot(WrapCircular(geopotential[date == date[1]], wrap = c(-180, 360 + 180)),
       aes(lon, lat)) +
    geom_contour(aes(z = gh))

# The same behaviour is now implemented directly in geom_contour2
# and geom_contour_fill
ggplot(geopotential[date == date[1]], aes(lon, lat)) +
    geom_contour2(aes(z = gh), xwrap = c(-180, 360 + 180))




