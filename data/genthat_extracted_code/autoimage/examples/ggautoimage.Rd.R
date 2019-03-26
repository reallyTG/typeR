library(autoimage)


### Name: ggautoimage
### Title: Display images using ggplot2
### Aliases: ggautoimage

### ** Examples

data(narccap)
# setup image for two days of narccap data
x <- rep(c(lon), 2)
y <- rep(c(lat), 2)
z <- c(tasmax[, , 1:2])
f <- factor(rep(c("day 1", "day 2"), each = length(lon)))
# load national borders
data("worldMapEnv", package = "maps")
lines <- maps::map("world", plot = FALSE)
# obtain us captial cities
data(us.cities, package = "maps")
cap <- us.cities[us.cities$capital == 2, ]
# convert to list format
points <- list(x = cap$lon, y = cap$lat)

## Not run: 
##D # basic images
##D ggautoimage(x, y, z, f)
##D # basic images with national borders and U.S. captials
##D ggautoimage(x, y, z, f, lines = lines, points = points)
##D # project coordinates with national borders and U.S. capitals
##D ggautoimage(x, y, z, f, lines = lines, points = points,
##D             proj = "bonne", parameters = 40)
##D # finer interpolation grid
##D ggautoimage(x, y, z, f, lines = lines, points = points,
##D             interp.args = list(no.X = 100, no.Y = 100))
## End(Not run)



