library(gss)


### Name: ColoCan
### Title: Colorectal Cancer Mortality Rate in Indiana Counties
### Aliases: ColoCan
### Keywords: datasets

### ** Examples

## Converting latitude and longitude to x-y coordinates
## The 49th county is Marion, where Indianapolis is located.
## Not run: 
##D ltln2xy <- function(latlon,latlon0) {
##D   lat <- latlon[,1]*pi/180; lon <- latlon[,2]*pi/180
##D   lt0 <- latlon0[1]*pi/180; ln0 <- latlon0[2]*pi/180
##D   x <- cos(lt0)*sin(lon-ln0); y <- sin(lat-lt0)
##D   cbind(x,y)
##D }
##D data(ColoCan)
##D latlon <- as.matrix(ColoCan[,c("lat","lon")])
##D ltln2xy(latlon,latlon[49,])
##D ## Clean up
##D rm(ltln2xy,ColoCan,latlon)
## End(Not run)



