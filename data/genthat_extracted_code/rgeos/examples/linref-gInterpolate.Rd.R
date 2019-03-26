library(rgeos)


### Name: gInterpolate
### Title: Interpolate Points along Line Geometry
### Aliases: gInterpolate
### Keywords: spatial

### ** Examples

gInterpolate(readWKT("LINESTRING(25 50, 100 125, 150 190)"),
             d=seq(0, 1, by = 0.2), normalized = TRUE)



