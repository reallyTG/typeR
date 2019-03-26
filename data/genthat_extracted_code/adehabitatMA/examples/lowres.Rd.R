library(adehabitatMA)


### Name: lowres
### Title: Reducing the Resolution of a Map
### Aliases: lowres
### Keywords: spatial

### ** Examples

data(meuse.grid)
m <- SpatialPixelsDataFrame(points = meuse.grid[c("x", "y")],
                            data = meuse.grid)
m

m <- m[,3:6]

## The initial image
image(m,3)

## The transformed image
m2 <- lowres(m, np = 4)
image(m2, 3)




