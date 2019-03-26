library(Rnightlights)


### Name: downloadNlTiles
### Title: Download the listed tiles for a given nlType in a given nlPeriod
### Aliases: downloadNlTiles

### ** Examples

#download VIIRS tiles for "KEN" which are tiles 2 and 5 for the specified
    #time periods
## Not run: 
##D Rnightlights:::downloadNlTiles("VIIRS.M", "201401", c(2, 5))
## End(Not run)

#same as above but getting the tileList automatically
## Not run: 
##D Rnightlights:::downloadNlTiles(nlType="VIIRS.M", 
##D     nlPeriod="201401", 
##D     tileList=Rnightlights:::getCtryTileList(ctryCodes="KEN", 
##D         nlType="VIIRS.M")
##D )
## End(Not run)

#returns TRUE if the download was successful or tile is cached locally




