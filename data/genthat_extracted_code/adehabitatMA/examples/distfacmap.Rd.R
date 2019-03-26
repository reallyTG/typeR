library(adehabitatMA)


### Name: distfacmap
### Title: Compute distances to the different levels of a factor map
### Aliases: distfacmap
### Keywords: spatial

### ** Examples


## Load meuse.grid data set and converts it to
## SpatialPixelsDataFrame
data(meuse.grid)
m <- SpatialPixelsDataFrame(points = meuse.grid[c("x", "y")],
                            data = meuse.grid)

## look at the soil type
image(m[,6])

## compute the distance to each soil type
sor <- distfacmap(m[,6], lev = c("type1","type2", "type3"))

## The results
sor
mimage(sor)




