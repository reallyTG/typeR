library(usdm)


### Name: plot.RasterVariogram
### Title: Plot variogram or variogram cloud or boxplot based on variogram
###   cloud
### Aliases: plot.RasterVariogram plot,RasterVariogram-method
### Keywords: methods spatial

### ** Examples

file <- system.file("external/spain.grd", package="usdm")

r <- brick(file) # reading a RasterBrick including 5 rasters (predictor variables)

r 

plot(r[[1]]) # visualize the raster layers

v1 <- Variogram(r[[1]]) # compute variogram for the first raster


plot(v1)

plot(v1,cloud=TRUE)

plot(v1,box=TRUE)




