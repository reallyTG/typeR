library(rgeos)


### Name: gProject
### Title: Project Points to Line Geometry
### Aliases: gProject
### Keywords: spatial

### ** Examples

l <- readWKT("LINESTRING(0 1, 3 4, 5 6)")
p1 <- readWKT("MULTIPOINT(3 2, 3 5)")
frac <- gProject(l, p1)
p2 <- gInterpolate(l, frac)
plot(l, axes=TRUE)
plot(p1, col = "blue", add = TRUE)
plot(p2, col = "red", add = TRUE)



