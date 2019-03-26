library(Rnightlights)


### Name: fnAggRadGdal
### Title: Calculate zonal statistics using GDAL
### Aliases: fnAggRadGdal

### ** Examples

#read the Kenya polygon downloaded from GADM and load the lowest admin level (ward)
## Not run: 
##D ctryPoly <- readCtryPolyAdmLayer(ctryCode="KEN", 
##D     Rnightlights:::getCtryShpLowestLyrNames(ctryCodes="KEN"))
##D     
##D #calculate the sum of radiances for the wards in Kenya
##D sumAvgRadRast <- Rnightlights:::fnAggRadGdal(ctryCode="KEN", ctryPoly=ctryPoly,
##D     nlType="VIIRS.M", nlPeriod="201401", nlStats=c("sum","mean"))
## End(Not run)




