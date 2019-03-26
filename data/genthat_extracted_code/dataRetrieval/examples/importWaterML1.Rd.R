library(dataRetrieval)


### Name: importWaterML1
### Title: Function to return data from the NWISWeb WaterML1.1 service
### Aliases: importWaterML1

### ** Examples

site_id <- "02177000"
startDate <- "2012-09-01"
endDate <- "2012-10-01"
offering <- '00003'
property <- '00060'
obs_url <- constructNWISURL(site_id,property,startDate,endDate,'dv')
## Not run: 
##D data <- importWaterML1(obs_url, asDateTime=TRUE)
##D 
##D groundWaterSite <- "431049071324301"
##D startGW <- "2013-10-01"
##D endGW <- "2014-06-30"
##D groundwaterExampleURL <- constructNWISURL(groundWaterSite, NA,
##D           startGW,endGW, service="gwlevels")
##D groundWater <- importWaterML1(groundwaterExampleURL)
##D groundWater2 <- importWaterML1(groundwaterExampleURL, asDateTime=TRUE)
##D 
##D unitDataURL <- constructNWISURL(site_id,property,
##D          "2013-11-03","2013-11-03",'uv')
##D unitData <- importWaterML1(unitDataURL,TRUE)
##D 
##D # Two sites, two pcodes, one site has two data descriptors:
##D siteNumber <- c('01480015',"04085427")
##D obs_url <- constructNWISURL(siteNumber,c("00060","00010"),startDate,endDate,'dv')
##D data <- importWaterML1(obs_url)
##D data$dateTime <- as.Date(data$dateTime)
##D data <- renameNWISColumns(data)
##D names(attributes(data))
##D attr(data, "url")
##D attr(data, "disclaimer")
##D 
##D inactiveSite <- "05212700"
##D inactiveSite <- constructNWISURL(inactiveSite, "00060", "2014-01-01", "2014-01-10",'dv')
##D inactiveSite <- importWaterML1(inactiveSite)
##D 
##D inactiveAndAcitive <- c("07334200","05212700")
##D inactiveAndAcitive <- constructNWISURL(inactiveAndAcitive, "00060", "2014-01-01", "2014-01-10",'dv')
##D inactiveAndAcitive <- importWaterML1(inactiveAndAcitive)
##D 
##D Timezone change with specified local timezone:
##D tzURL <- constructNWISURL("04027000", c("00300","63680"), "2011-11-05", "2011-11-07","uv")
##D tzIssue <- importWaterML1(tzURL, TRUE, "America/Chicago")
##D 
##D #raw XML
##D url <- constructNWISURL(service = 'dv', siteNumber = '02319300', parameterCd = "00060", 
##D                          startDate = "2014-01-01", endDate = "2014-01-01")
##D raw <- content(GET(url), as = 'raw')
##D rawParsed <- importWaterML1(raw)
## End(Not run)
filePath <- system.file("extdata", package="dataRetrieval")
fileName <- "WaterML1Example.xml"
fullPath <- file.path(filePath, fileName)
importFile <- importWaterML1(fullPath,TRUE)




