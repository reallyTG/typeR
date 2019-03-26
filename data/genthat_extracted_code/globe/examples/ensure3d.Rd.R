library(globe)


### Name: ensure
### Title: Checking and converting coordinates
### Aliases: ensure3d ensurelonlat
### Keywords: spatial

### ** Examples

ensure3d(c(1,4,2))
ensure3d(matrix(1:3, ncol = 3))
ensure3d(data.frame(x = 1:2, y = 3:4, z = 5:6), single = FALSE)
ensure3d(data.frame(lon = c(0,180), lat = c(-45,45)), single = FALSE)
ensurelonlat(c(145, -90))



