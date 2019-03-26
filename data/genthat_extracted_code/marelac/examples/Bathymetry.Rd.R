library(marelac)


### Name: Bathymetry
### Title: World Bathymetric Data
### Aliases: Bathymetry
### Keywords: datasets

### ** Examples

par(mar = c(2,2,2,2))
image(Bathymetry$x, Bathymetry$y, Bathymetry$z, col = femmecol(100),
      asp = TRUE, xlab = "dg", ylab = "dg")
contour(Bathymetry$x, Bathymetry$y, Bathymetry$z, asp = TRUE, add = TRUE)


# remove land
zz       <- Bathymetry$z
zz[zz>0] <- 0

image(Bathymetry$x, Bathymetry$y, zz, col = c(femmecol(100), "black"),
      asp = TRUE)
contour(Bathymetry$x, Bathymetry$y, zz, asp = TRUE, add = TRUE)



