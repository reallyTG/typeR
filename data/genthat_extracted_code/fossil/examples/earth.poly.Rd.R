library(fossil)


### Name: earth.poly
### Title: Calculating a Minimum Convex Polygon
### Aliases: earth.poly
### Keywords: graphs

### ** Examples

#1/8th the surface area of the earth
a <- matrix(c(0, 0, 0, 90, 90, 0, 25, 25), 4, 2, byrow = TRUE)
earth.poly(a)



