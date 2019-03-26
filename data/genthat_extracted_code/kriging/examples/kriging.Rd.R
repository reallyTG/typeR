library(kriging)


### Name: kriging
### Title: Ordinary Kriging
### Aliases: kriging
### Keywords: datagen models

### ** Examples

# Krige random data for a specified area using a list of polygons
library(maps)
usa <- map("usa", "main", plot = FALSE)
p <- list(data.frame(usa$x, usa$y))

# Create some random data
x <- runif(50, min(p[[1]][,1]), max(p[[1]][,1]))
y <- runif(50, min(p[[1]][,2]), max(p[[1]][,2]))
z <- rnorm(50)

# Krige and create the map
kriged <- kriging(x, y, z, polygons=p, pixels=300)
image(kriged, xlim = extendrange(x), ylim = extendrange(y))




