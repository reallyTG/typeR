library(agriwater)


### Name: radiation_modis
### Title: Energy balance using Landsat-8 images with single
###   agrometeorological data.
### Aliases: radiation_modis

### ** Examples

library(agriwater)

# dependencies of package 'agriwater'
library(sp)
library(raster)
library(rgdal)

# Using a temporary folder to run example
wd <- tempdir()
initial = getwd()
setwd(wd)

# creating raster which simulate Sentinel-2 reflectances - for using
# real data, please download:
# https://drive.google.com/open?id=14E1wHNLxG7_Dh4I-GqNYakj8YJDgKLzk

wd <- tempdir()
setwd <- tempdir()
xy <- matrix(rnorm(100, mean = 0.07, sd = 0.01), 10, 10)
rast <- raster(xy)
extent(rast) <- c(-40.5,-40.45,-9.5,-9.45)
projection(rast) <- CRS("+proj=longlat +datum=WGS84")
writeRaster(rast, file.path(wd, "B2"),format = "GTiff", overwrite=TRUE)
xy <- matrix(rnorm(100, mean = 0.05, sd = 0.015),10, 10)
rast <- raster(xy)
extent(rast) <- c(-40.5,-40.45,-9.5,-9.45)
projection(rast) <- CRS("+proj=longlat +datum=WGS84")
writeRaster(rast, file.path(wd, "B1"),format = "GTiff", overwrite=TRUE)

# creating mask of study area
mask <- as(extent(rast), 'SpatialPolygons')
projection(mask) <- CRS("+proj=longlat +datum=WGS84")
shapefile(mask, file.path(wd,"mask.shp"), overwrite=TRUE)

# using "agriwater" - it's the same procedure as the used for
# radiation_l8(), radiation_l8t(), radiation_s2(),
# radiation_l8_grid(), radiation_l8t_grid(),
# radiation_s2_grid(), radiation_s2() and radiation_modis_grid()
DOY = 134
a = 1.8
b = -0.008
RG = 17.6
Ta = 27.9
ET0 = 3.8
radiation_modis(DOY, RG, Ta, ET0, a, b)

#Exiting temporary folder and returning to previous workspace
setwd(initial)



