library(oce)


### Name: [[,amsr-method
### Title: Extract Something From an amsr Object
### Aliases: [[,amsr-method

### ** Examples

## Not run: 
##D # Show a daytime SST image, along with an indication of whether
##D # the NA values are from rain.
##D library(oce)
##D earth <- read.amsr("f34_20160102v7.2.gz")
##D fclat <- subset(earth , 35 <= latitude & latitude <= 55)
##D fc <- subset(fclat , -70 <= longitude & longitude <= -30)
##D par(mfrow=c(2, 1))
##D plot(fc, "SSTDay")
##D rainy <- fc[["SSTDay", "raw"]] == as.raw(0xfb)
##D lon <- fc[["longitude"]]
##D lat <- fc[["latitude"]]
##D asp <- 1 / cos(pi*mean(lat)/180)
##D imagep(lon, lat, rainy, asp=asp)
##D mtext("red: too rainy to sense SSTDay")
## End(Not run)



