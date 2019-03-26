library(psyosphere)


### Name: distance_point
### Title: Add the distances to a point from each coordinate
### Aliases: distance_point

### ** Examples

data(psyo)

# Un-named list
point <- c(4.936197, 52.314701)
distance_point(psyo[1,], point, bind = FALSE)

# Named list
point <- c(lat = 52.314701, lon = 4.936197)
distance_point(psyo[1,], point, bind = FALSE)

# Multiple distance to point
coordinates <- distance_point(psyo, point)



