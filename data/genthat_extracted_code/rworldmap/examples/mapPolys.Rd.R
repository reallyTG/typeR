library(rworldmap)


### Name: mapPolys
### Title: Map polygon data.
### Aliases: mapPolys
### Keywords: aplot

### ** Examples



## this example uses downloaded files
## to run it download the files
## and remove the comment symbols '#' from all the lines starting with a single '#'

## US states map downloaded from :
## http://www2.census.gov/cgi-bin/shapefiles2009/national-files

#inFile <- 'tl_2009_us_stateec.shp'
#sPDF <- readShapePoly(inFile)
#str(sPDF@data)

##################
## use mapPolys to map the sPDF
#mapPolys(sPDF,nameColumnToPlot = "ALANDEC")
#mapPolys(sPDF,nameColumnToPlot = "AWATEREC",mapRegion='North America')

##################
## join some other data to it
## education data downloaded from here as xls then saved as csv
## http://nces.ed.gov/ccd/drpcompstatelvl.asp

#dataFile <- 'SDR071A_xls.csv'
#dF <- read.csv(dataFile,as.is=TRUE)
#str(dF)
## STATENAME
## DRP912 Dropout Rate, Grades 9 through 12

## joining the data to the map
## based upon state names (column NAMEEC in map, and STATENAME in the data)
#sPDF2 <- joinData2Map(dF
#        , nameMap = sPDF
#        , nameJoinIDMap = "NAMEEC"
#        , nameJoinColumnData = "STATENAME")

#################
## plot one of the attribute variables
#mapDevice()# to set nice shape map window
#mapPolys(sPDF2,nameColumnToPlot = "DRP912",mapRegion='North America')


#################
###to map US counties data (Tiger) downloaded from :
##http://www2.census.gov/cgi-bin/shapefiles2009/national-files

#inFile <- 'tl_2009_us_county.shp'
#sPDF <- readShapePoly(inFile)
#str(sPDF@data)
#mapPolys(sPDF,nameColumnToPlot='AWATER',xlim=c(-140,-65), ylim=c(25,45))






