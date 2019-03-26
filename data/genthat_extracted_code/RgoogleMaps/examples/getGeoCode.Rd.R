library(RgoogleMaps)


### Name: getGeoCode
### Title: geocoding utility
### Aliases: getGeoCode

### ** Examples



getGeoCode("1600 Amphitheatre Parkway, Mountain View, CA")


getGeoCode("Brooklyn")


#You can run this on the entire column of a data frame or a data table:


DF = cbind.data.frame(address=c("Berlin,Germany", "Princeton,NJ", 


          "cadillac+mountain+acadia+national+park"), lat = NA, lon = NA)


DF <- with(DF, data.frame(address, t(sapply(DF$address, getGeoCode))))








