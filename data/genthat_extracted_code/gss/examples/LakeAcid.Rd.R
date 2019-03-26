library(gss)


### Name: LakeAcidity
### Title: Water Acidity in Lakes
### Aliases: LakeAcidity
### Keywords: datasets

### ** Examples

## Converting latitude and longitude to x-y coordinates
## Not run: 
##D ltln2xy <- function(latlon,latlon0) {
##D   lat <- latlon[,1]*pi/180; lon <- latlon[,2]*pi/180
##D   lt0 <- latlon0[1]*pi/180; ln0 <- latlon0[2]*pi/180
##D   x <- cos(lt0)*sin(lon-ln0); y <- sin(lat-lt0)
##D   cbind(x,y)
##D }
##D data(LakeAcidity)
##D latlon <- as.matrix(LakeAcidity[,c("lat","lon")])
##D m.lat <- (min(latlon[,1])+max(latlon[,1]))/2
##D m.lon <- (min(latlon[,2])+max(latlon[,2]))/2
##D ltln2xy(latlon,c(m.lat,m.lon))
##D ## Clean up
##D rm(ltln2xy,LakeAcidity,latlon,m.lat,m.lon)
## End(Not run)



