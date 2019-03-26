library(dataRetrieval)


### Name: readNWISqw
### Title: Raw Data Import for USGS NWIS QW Data
### Aliases: readNWISqw
### Keywords: USGS data import service web

### ** Examples

site_ids <- c('04024430','04024000')
startDate <- '2010-01-01'
endDate <- ''
parameterCd <- c('34247','30234','32104','34220')
## Not run: 
##D rawNWISqwData <- readNWISqw(site_ids,parameterCd,startDate,endDate)
##D rawNWISqwDataReshaped <- readNWISqw(site_ids,parameterCd,
##D           startDate,endDate,reshape=TRUE)
##D parameterCd <- "all"
##D rawNWISall <- readNWISqw(site_ids,parameterCd,
##D           startDate,endDate)
##D pgroup <- c("NUT")
##D rawNWISNutrients <- readNWISqw(site_ids,pgroup,
##D           startDate,endDate)
##D groups <- c("NUT","OPE")
##D rawNWISNutOpe <- readNWISqw(site_ids,groups,
##D           startDate,endDate) 
##D rawNWISOpe <- readNWISqw(site_ids,"OPE",
##D           startDate,endDate) 
##D          
## End(Not run) 



