library(pointdensityP)


### Name: pointdensity
### Title: Point density function for geospatial data
### Aliases: pointdensity
### Keywords: density spatial

### ** Examples

Arigon_test <- Arigon[1:1000,]
Arigon_density <- pointdensity(df = Arigon_test, lat_col = "latitude", 
lon_col = "longitude", date_col = "date", grid_size = 1, radius = 2)



