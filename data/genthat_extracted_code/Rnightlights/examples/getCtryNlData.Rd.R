library(Rnightlights)


### Name: getCtryNlData
### Title: Returns nightlight statistics for the given ctryCode and nlType
###   in the given nPeriods
### Aliases: getCtryNlData

### ** Examples

#NOTE: missing stats implies all stats as given by pkgOptions("nlStats")

#long running examples which also require large downloads
## Not run: 
##D getCtryNlData("KEN", "KEN_adm0", "VIIRS.M", ignoreMissing=NULL)
##D     #returns either all requested data if it exists i.e. all nlPeriods
##D     #and all nlStats for KEN otherwise NULL
## End(Not run)

## Not run: 
##D getCtryNlData("KEN", "KEN_adm0", "OLS.Y", ignoreMissing=TRUE)
##D     #Returns all requested data if it exists i.e. all nlPeriods and all
##D     #nlStats for KEN but omits any missing data
##D     
## End(Not run)
 
## Not run: 
##D getCtryNlData(ctryCode="KEN", "KEN_adm0", "VIIRS.Y", ignoreMissing=FALSE)
##D     #Returns all requested data i.e. all nlPeriods and all
##D     #nlStats for KEN. All missing data will be downloaded and processed
##D     
## End(Not run)
 
## Not run: 
##D getCtryNlData("KEN", "KEN_adm0", "VIIRS.M", nlPeriods=c("existingNlPeriod", "missingNlPeriod"),
##D     nlStats=c("sum", "unknownStat"), ignoreMissing=NULL)
##D     #Returns NULL due to missingNlPeriod and unknownStat not already existing
##D     #(ignoreMissing=NULL returns all data if exists or if any is missing returns NULL)
##D     
## End(Not run)

## Not run: 
##D getCtryNlData("KEN", "KEN_adm0", "VIIRS.D", nlPeriods=c("existingNlPeriod", "missingNlPeriod"),
##D     nlStats=c("existingStat", "missingStat"), ignoreMissing=TRUE)
##D    #Returns existingStat for existingNlPeriods omits missingNlPeriod and missingStat
##D    #(ignoreMissing=TRUE returns only existing data)
##D    
## End(Not run)
 
## Not run: 
##D getCtryNlData("KEN", "KEN_adm0", "VIIRS.M", nlPeriods=c("existingNlPeriod", "missingNlPeriod"),
##D     nlStats=c("sum", "unknownStat"), ignoreMissing=FALSE)
##D     #Runs processNlData for missingStat in "missingNlPeriod" and returns
##D     #"existingStat" and "missingStat" for both "existingNlPeriod" and
##D     #"missingNlPeriod"
##D     #(ignoreMissing=FALSE must return all data: forces processing of any missing)
##D     
## End(Not run)
 



