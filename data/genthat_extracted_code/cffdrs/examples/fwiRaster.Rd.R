library(cffdrs)


### Name: fwiRaster
### Title: Raster-based Fire Weather Index System
### Aliases: fwiRaster
### Keywords: methods

### ** Examples

library(cffdrs)
require(raster)
# The test data is a stack with four input variables including 
# daily noon temp, rh, ws, and prec (we recommend tif format):
day01src <- system.file("extdata","test_rast_day01.tif",package="cffdrs")
day01 <- stack(day01src)
day01 <- crop(day01,c(250,255,47,51))
# assign variable names:
names(day01)<-c("temp","rh","ws","prec")
# (1) use the initial values
foo<-fwiRaster(day01)
plot(foo)
### Additional, longer running examples are commented out below ###
# (2) use initial values with larger raster
# day01 <- stack(day01src)
# names(day01)<-c("temp","rh","ws","prec")
# foo<-fwiRaster(day01)
# plot(foo)
# (3) Calculate FWI System variables based on the previous day's
# fwi output:
# load the second day inputs:
# day02src <- system.file("extdata","test_rast_day02.tif",package="cffdrs")
# day02 <- stack(day02src)
# names(day02)<-c("temp","rh","ws","prec")
# use the previous day's output as initial:
# foo1<-fwiRaster(day02,init=foo)
# plot(foo1)



