library(Rnightlights)


### Name: processNlData
### Title: Downloads nightlight tiles and country polygons and calls the
###   function to process them
### Aliases: processNlData

### ** Examples


#long running examples which may require large downloads
## Not run: 
##D #Example 1: process monthly VIIRS nightlights for all countries at the
##D     lowest admin level and for all nlPeriods available e.g. to create a 
##D     local cache or repo
##D     
##D     processNlData() #process VIIRS nightlights for all countries and all periods
##D 
##D #Example 2: process monthly VIIRS nightlights for all countries in 2014 only
##D 
##D     nlPeriods <- getAllNlPeriods("VIIRS.M") #get a list of all nightlight periods to present-day
##D 
##D     nlPeriods <- nlPeriods[grep("^2014", nlPeriods)] #filter only periods in 2014
##D 
##D     processNlData(nlTypes="VIIRS.M", nlPeriods=nlPeriods)
##D 
##D #Example 3: process OLS nightlights for countries KEN & RWA from 1992
##D #     to 2000
##D 
##D     cCodes <- c("KEN", "RWA")
##D 
##D     nlPeriods <- getAllNlPeriods("VIIRS.M")
##D 
##D     nlPeriods <- nlRange("1992", "2000", "OLS.Y")
##D 
##D     processNlData(ctryCodes=cCodes, nlPeriods=nlPeriods)
##D 
##D #Example 4: process VIIRS nightlights for countries KEN & RWA in 2014 Oct to 2014 Dec only
##D 
##D     processNlData(ctryCodes=c("KEN", "RWA"), nlTypes="VIIRS.M", 
##D         nlPeriods=c("201410", "201411", "201412"))
##D     
##D #Example 5: process all nightlights, all countries, all stats in one thread
##D 
##D    processNlData() 
##D    
##D #Example 6: process all VIIRS monthly nightlights, all countries, all stats with each
##D #   year in a separate thread. Create a separate R script for each year as follows:
##D 
##D     library(Rnightlights)
##D 
##D     nlPeriods <- getAllNlPeriods("VIIRS.M")
##D 
##D     nlPeriods_2014 <- nlPeriods[grep("^2014", nlPeriods)]
##D 
##D     processNlData(nlPeriods=nlPeriods_2014)
##D 
##D     #Run the script from the command line as:
##D     
##D     #R CMD BATCH script_name_2014.R
##D     
## End(Not run)



