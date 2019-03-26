library(dataRetrieval)


### Name: readWQPdata
### Title: General Data Import from Water Quality Portal
### Aliases: readWQPdata
### Keywords: WQP data import service web

### ** Examples

## Not run: 
##D nameToUse <- "pH"
##D pHData <- readWQPdata(siteid="USGS-04024315",characteristicName=nameToUse)
##D pHData_summary <- readWQPdata(bBox=c(-90.10,42.67,-88.64,43.35),
##D      characteristicName=nameToUse, querySummary=TRUE)
##D startDate <- as.Date("2013-01-01")
##D nutrientDaneCounty <- readWQPdata(countycode="US:55:025",startDate=startDate,
##D                         characteristicType="Nutrient")
##D secchi.names = c("Depth, Secchi disk depth", 
##D                  "Depth, Secchi disk depth (choice list)", 
##D                  "Secchi Reading Condition (choice list)", 
##D                  "Secchi depth", 
##D                  "Water transparency, Secchi disc")
##D args <- list('startDateLo' = startDate, 
##D              'startDateHi' = "2013-12-31", 
##D               statecode="WI", 
##D               characteristicName=secchi.names)
##D 
##D wqp.data <- readWQPdata(args)   
##D 
##D args_2 <- list('startDateLo' = startDate, 
##D              'startDateHi' = "2013-12-31", 
##D               statecode="WI", 
##D               characteristicName=secchi.names,
##D               querySummary=TRUE)
##D 
##D wqp.summary <- readWQPdata(args_2) 
##D 
##D arg_3 <- list('startDateLo' = startDate, 
##D              'startDateHi' = "2013-12-31")
##D arg_4 <- list(statecode="WI", 
##D               characteristicName=secchi.names)
##D wqp.summary <- readWQPdata(arg_3, arg_4, querySummary=TRUE)
##D wqp.summary_WI <- readWQPdata(arg_3, statecode="WI", 
##D                               characteristicName=secchi.names, 
##D                               querySummary=TRUE)
##D                               
##D # querying by county
##D dailyLexingtonVA <- readWQPdata(statecode = "Virginia", 
##D                                 countycode="Lexington", 
##D                                 parameterCd = "00010") 
##D                                 
##D # Biological data:
##D bioData <- readWQPdata(statecode = "WI",
##D                        countycode = "Dane",
##D                        providers = "BIODATA")
##D                                 
## End(Not run)



