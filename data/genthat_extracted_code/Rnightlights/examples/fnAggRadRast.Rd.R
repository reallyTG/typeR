library(Rnightlights)


### Name: fnAggRadRast
### Title: Calculate statistics on a nightlight raster that fall within a
###   polygon
### Aliases: fnAggRadRast

### ** Examples

#read the Kenya polygon downloaded from GADM and load the lowest admin level (ward)
## Not run: 
##D ctryPoly <- readCtryPolyAdmLayer(ctryCode="KEN", 
##D     Rnightlights:::getCtryShpLowestLyrNames(ctryCodes="KEN"))
##D     
##D # the VIIRS nightlight raster cropped earlier to the country outline
##D ctryRastCropped <- raster::raster(Rnightlights:::getCtryRasterOutputFnamePath(ctryCode="KEN",
##D     nlType="VIIRS.M", nlPeriod="201401"))
##D 
##D #calculate the sum of radiances for the wards in Kenya
##D sumAvgRadRast <- Rnightlights:::fnAggRadRast(ctryPoly=ctryPoly,
##D     ctryRastCropped=ctryRastCropped, nlType="VIIRS.M", nlStats=c("sum","mean"))
## End(Not run)



