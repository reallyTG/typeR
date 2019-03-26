library(metR)


### Name: geom_arrow
### Title: Arrows
### Aliases: geom_arrow geom_vector GeomArrow StatArrow
### Keywords: datasets

### ** Examples

library(data.table)
library(ggplot2)

data(seals)
# If the velocity components are in the same units as the axis,
# geom_vector() (or geom_arrow(preserve.dir = TRUE)) might be a better option
ggplot(seals, aes(long, lat)) +
    geom_arrow(aes(dx = delta_long, dy = delta_lat), skip = 1, color = "red") +
    geom_vector(aes(dx = delta_long, dy = delta_lat), skip = 1) +
    scale_mag()

data(geopotential)
geopotential <- copy(geopotential)[date == date[1]]
geopotential[, gh.z := Anomaly(gh), by = .(lat)]
geopotential[, c("u", "v") := GeostrophicWind(gh.z, lon, lat)]

(g <- ggplot(geopotential, aes(lon, lat)) +
    geom_arrow(aes(dx = dlon(u, lat), dy = dlat(v)), skip.x = 3, skip.y = 2,
               color = "red") +
    geom_vector(aes(dx = dlon(u, lat), dy = dlat(v)), skip.x = 3, skip.y = 2) +
    scale_mag(max_size = 2, guide = "none"))

# A dramatic illustration of the difference between arrow and vector
g + coord_polar()

# When plotting winds in a lat-lon grid, a good way to have both
# the correct direction and an interpretable magnitude is to define
# the angle by the longitud and latitude displacement and the magnitude
# by the wind velocity. That way arrows are always parallel to streamlines
# and their magnitude are in the correct units.
ggplot(geopotential, aes(lon, lat)) +
    geom_contour(aes(z = gh.z)) +
    geom_vector(aes(angle = atan2(dlat(v), dlon(u, lat))*180/pi,
                   mag = Mag(v, u)), skip = 1, pivot = 0.5) +
    scale_mag()

# Sverdrup transport
library(data.table)
b <- 10
d <- 10
grid <- as.data.table(expand.grid(x = seq(1, d, by = 0.5),
                                  y = seq(1, b, by = 0.5)))
grid[, My := -sin(pi*y/b)*pi/b]
grid[, Mx := -pi^2/b^2*cos(pi*y/b)*(d - x)]

ggplot(grid, aes(x, y)) +
    geom_arrow(aes(dx = Mx, dy = My))




