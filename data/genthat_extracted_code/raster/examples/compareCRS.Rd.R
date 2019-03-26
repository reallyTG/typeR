library(raster)


### Name: compareCRS
### Title: Partially compare two CRS objects
### Aliases: compareCRS
### Keywords: spatial

### ** Examples
 
compareCRS("+proj=lcc +lat_1=48 +lat_2=33 +lon_0=-100 +ellps=WGS84",
  "+proj=longlat +datum=WGS84")
compareCRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0",
  "+proj=longlat +datum=WGS84")
compareCRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0", 
  "+proj=longlat +datum=WGS84", verbatim=TRUE)
compareCRS("+proj=longlat +datum=WGS84", NA)
compareCRS("+proj=longlat +datum=WGS84", NA, unknown=TRUE)



