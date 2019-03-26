library(googlePolylines)


### Name: encode
### Title: Encode
### Aliases: encode encode.sf encode.data.frame

### ** Examples


## data.frame
df <- data.frame(polygonId = c(1,1,1,1),
  lineId = c(1,1,1,1),
  lon = c(-80.190, -66.118, -64.757, -80.190),
  lat = c(26.774, 18.466, 32.321, 26.774))
  
## on a data.frame, it will attemp to find the lon & lat columns
encode(df)

## use byrow = TRUE to convert each row individually
encode(df, byrow = TRUE)


## Not run: 
##D 
##D ## sf objects
##D library(sf)
##D nc <- sf::st_read(system.file("shape/nc.shp", package="sf"))
##D 
##D encoded <- encode(nc)
##D 
##D ## view attributes
##D attributes(encoded) 
##D 
##D ## view attributes of subset object
##D attributes(encoded[, c("AREA", "PERIMETER", "geometry")])
##D 
##D ## view attributes without encoded column
##D attributes(encoded[, c("AREA", "PERIMETER")])
##D 
##D ## strip attributes
##D encodedLite <- encode(nc, strip = TRUE)
##D 
##D attributes(encodedLite)
##D 
##D ## view attributes of subset lite object
##D attributes(encodedLite[, c("AREA", "PERIMETER", "geometry")])
##D 
##D ## view attributes without encoded column
##D attributes(encodedLite[, c("AREA", "PERIMETER")])
## End(Not run)




