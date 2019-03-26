library(IsoriX)


### Name: CalibDataBat2
### Title: Calibration dataset for bat species
### Aliases: CalibDataBat2
### Keywords: datasets

### ** Examples


head(CalibDataBat2)
str(CalibDataBat2)

## The following example require to have downloaded
## a large elevation raster with the function getelev()
## and will therefore not run unless you uncomment it

#if(require(raster)){
#    ## We delete the elevation data
#    CalibDataBat2$elev <- NULL
#
#    ## We reconstruct the elevation data using an elevation raster
#    ## (see ?getelev for details on how to get the tif file)
#    ElevationRasterBig <- raster("gmted2010_30mn.tif")
#    CalibDataBat2$elev <- extract(
#        ElevationRasterBig,
#        cbind(CalibDataBat2$long, CalibDataBat2$lat))
#    head(CalibDataBat2)
#}





