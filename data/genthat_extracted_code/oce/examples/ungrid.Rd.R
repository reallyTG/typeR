library(oce)


### Name: ungrid
### Title: Extract (x, y, z) from (x, y, grid)
### Aliases: ungrid

### ** Examples


library(oce)
data(wind)
u <- interpBarnes(wind$x, wind$y, wind$z)
contour(u$xg, u$yg, u$zg)
U <- ungrid(u$xg, u$yg, u$zg)
points(U$x, U$y, col=oce.colorsJet(100)[rescale(U$grid, rlow=1, rhigh=100)], pch=20)



