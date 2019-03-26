library(SpatialExtremes)


### Name: rgp
### Title: Gaussian Random Fields Simulation
### Aliases: rgp
### Keywords: distribution

### ** Examples

x <- y <- seq(0, 20, length = 100)
coord <- cbind(x, y)
gp <- rgp(1, coord, cov.mod = "whitmat", grid = TRUE)
filled.contour(x, y, gp, color.palette = terrain.colors)



