library(bivrp)


### Name: is.point.inside
### Title: Determine if point is inside or outside a simple polygon area
### Aliases: is.point.inside

### ** Examples

my.polygon <- data.frame(c(1, 2, 3, 4, 3),
                         c(1, 0, .5, 3, 4))
points.to.test <- list(c(0, 0), c(2.5, 1), c(3.5, 4))

unlist(lapply(points.to.test, is.point.inside, my.polygon))




