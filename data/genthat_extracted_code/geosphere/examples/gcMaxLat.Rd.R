library(geosphere)


### Name: gcMaxLat
### Title: Highest latitude on a great circle
### Aliases: gcMaxLat
### Keywords: spatial

### ** Examples

gcMaxLat(c(5,52), c(-120,37))

# Another way to get there:
f <- function(lon){gcLat(c(5,52), c(-120,37), lon)}
optimize(f, interval=c(-180, 180), maximum=TRUE)



