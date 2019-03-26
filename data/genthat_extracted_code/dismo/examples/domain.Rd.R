library(dismo)


### Name: domain
### Title: Domain
### Aliases: domain domain,Raster,SpatialPoints-method
###   domain,Raster,matrix-method domain,Raster,data.frame-method
###   domain,matrix,missing-method domain,data.frame,missing-method
###   Domain-class
### Keywords: spatial

### ** Examples

logo <- stack(system.file("external/rlogo.grd", package="raster"))
#presence data
pts <- matrix(c(48.243420, 48.243420, 47.985820, 52.880230, 49.531423, 46.182616, 54.168232, 
  69.624263, 83.792291, 85.337894, 74.261072, 83.792291, 95.126713, 84.565092, 66.275456, 
  41.803408, 25.832176, 3.936132, 18.876962, 17.331359,7.048974, 13.648543, 26.093446, 
  28.544714, 39.104026, 44.572240, 51.171810, 56.262906, 46.269272, 38.161230, 30.618865,
  21.945145, 34.390047, 59.656971, 69.839163, 73.233228, 63.239594, 45.892154, 43.252326,
  28.356155), ncol=2)
d <- domain(logo, pts)
p <- predict(d, logo)



