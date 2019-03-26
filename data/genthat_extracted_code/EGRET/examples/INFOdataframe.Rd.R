library(EGRET)


### Name: INFOdataframe
### Title: Import metadata to create INFO data frame
### Aliases: INFOdataframe readNWISInfo readWQPInfo readUserInfo
### Keywords: USGS data import service web

### ** Examples

# These examples require an internet connection to run
# Automatically gets information about site 05114000 and temperature
## Not run: 
##D INFO <- readNWISInfo('05114000','00010')
## End(Not run)
# These examples require an internet connection to run
# Automatically gets information about site 01594440 and temperature, no interaction with user
nameToUse <- 'Specific conductance'
pcodeToUse <- '00095'
## Not run: 
##D INFO <- readWQPInfo('USGS-04024315',pcodeToUse)
##D 
##D INFO2 <- readWQPInfo('WIDNR_WQX-10032762',nameToUse)
##D # To adjust the label names:
##D INFO$shortName <- "Little"
##D INFO$paramShortName <- "SC"
## End(Not run)
filePath <- system.file("extdata", package="EGRET")
filePath <- paste(filePath,"/",sep="")
fileName <- 'infoTest.csv'
INFO <- readUserInfo(filePath,fileName, separator=",",interactive=FALSE)



