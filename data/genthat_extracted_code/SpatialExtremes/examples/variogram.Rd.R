library(SpatialExtremes)


### Name: variogram
### Title: Empirical variogram
### Aliases: variogram
### Keywords: hplot

### ** Examples

n.site <- 20
n.obs <- 100
coord <- matrix(runif(2 * n.site, 0, 10), ncol = 2)
data <- rgp(n.obs, coord, "powexp", sill = 2, range = 3, smooth = 1)
variogram(data, coord)



