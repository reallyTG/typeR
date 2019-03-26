library(raster)


### Name: autocorrelation
### Title: Spatial autocorrelation
### Aliases: Geary Moran MoranLocal GearyLocal
### Keywords: spatial

### ** Examples

r <- raster(nrows=10, ncols=10)
r[] <- 1:ncell(r)

Moran(r)
# Rook's case
f <- matrix(c(0,1,0,1,0,1,0,1,0), nrow=3)
Moran(r, f)

Geary(r)

x1 <- MoranLocal(r)

# Rook's case
x2 <- MoranLocal(r, w=f)



