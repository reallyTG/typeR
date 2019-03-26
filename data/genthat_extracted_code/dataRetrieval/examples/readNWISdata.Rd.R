library(dataRetrieval)


### Name: readNWISdata
### Title: General Data Import from NWIS
### Aliases: readNWISdata

### ** Examples

## Not run: 
##D # Examples not run for time considerations
##D dataTemp <- readNWISdata(stateCd="OH",parameterCd="00010", service="dv")
##D instFlow <- readNWISdata(sites="05114000", service="iv", 
##D                    parameterCd="00060", 
##D                    startDate="2014-05-01T00:00Z",endDate="2014-05-01T12:00Z")
##D                                                    
##D instFlowCDT <- readNWISdata(sites="05114000", service="iv", 
##D                    parameterCd="00060", 
##D                    startDate="2014-05-01T00:00",endDate="2014-05-01T12:00",
##D                    tz="America/Chicago")
##D 
##D #Empty:
##D multiSite <- readNWISdata(sites=c("04025000","04072150"), service="iv", 
##D                            parameterCd="00010")
##D #Not empty:
##D multiSite <- readNWISdata(sites=c("04025500","040263491"), 
##D                            service="iv", parameterCd="00060")
##D bBoxEx <- readNWISdata(bBox=c(-83,36.5,-81,38.5), parameterCd="00010")
##D 
##D startDate <- as.Date("2013-10-01")
##D endDate <- as.Date("2014-09-30")
##D waterYear <- readNWISdata(bBox=c(-83,36.5,-81,38.5), parameterCd="00010", 
##D                   service="dv", startDate=startDate, endDate=endDate)
##D siteInfo <- readNWISdata(stateCd="WI", parameterCd="00010",
##D                   hasDataTypeCd="iv", service="site")
##D qwData <- readNWISdata(bBox=c(-82.5,41.52,-81,41),startDate=as.Date("2000-01-01"),
##D                   drain_area_va_min=50, qw_count_nu=50,qw_attributes="expanded",
##D                   qw_sample_wide="wide",list_of_search_criteria=c("lat_long_bounding_box",
##D                   "drain_area_va","obs_count_nu"),service="qw")
##D temp <- readNWISdata(bBox=c(-83,36.5,-81,38.5), parameterCd="00010", service="site", 
##D                    seriesCatalogOutput=TRUE)
##D wiGWL <- readNWISdata(stateCd="WI",service="gwlevels")
##D meas <- readNWISdata(state_cd="WI",service="measurements",format="rdb_expanded")
##D 
##D waterYearStat <- readNWISdata(site=c("03112500"),service="stat",statReportType="annual",
##D                  statYearType="water", missingData="on")
##D monthlyStat <- readNWISdata(site=c("03112500","03111520"),
##D                             service="stat",
##D                             statReportType="monthly")                                   
##D dailyStat <- readNWISdata(site=c("03112500","03111520"),
##D                           service="stat",
##D                           statReportType="daily",
##D                           statType=c("p25","p50","p75","min","max"),
##D                           parameterCd="00065")
##D allDailyStats <- readNWISdata(site=c("03111548"),
##D                               service="stat",
##D                               statReportType="daily",
##D                               statType=c("p25","p50","p75","min","max"),
##D                               parameterCd="00060")
##D 
##D dailyWV <- readNWISdata(stateCd = "West Virginia", parameterCd = "00060")
##D 
##D arg.list <- list(site="03111548",
##D                  statReportType="daily",
##D                  statType=c("p25","p50","p75","min","max"),
##D                  parameterCd="00060")
##D allDailyStats_2 <- readNWISdata(arg.list, service="stat")
##D 
##D #' # use county names to get data
##D dailyStaffordVA <- readNWISdata(stateCd = "Virginia",
##D                                 countyCd="Stafford",
##D                                 parameterCd = "00060",
##D                                 startDate = "2015-01-01",
##D                                 endDate = "2015-01-30")
##D va_counties <- c("51001","51003","51005","51007","51009","51011","51013","51015")
##D va_counties_data <- readNWISdata(startDate = "2015-01-01", endDate = "2015-12-31", 
##D parameterCd = "00060", countycode = va_counties)
##D site_id <- '01594440'
##D rating_curve <- readNWISdata(service = "rating", site_no = site_id, file_type="base")
##D all_sites_base <- readNWISdata(service = "rating", file_type="base")
##D all_sites_core <- readNWISdata(service = "rating", file_type="corr")
##D all_sites_exsa <- readNWISdata(service = "rating", file_type="exsa")
##D all_sites_24hrs <- readNWISdata(service = "rating", file_type="exsa", period = 24)
##D 
##D today <- readNWISdata(service="iv", startDate = Sys.Date(), 
##D                       parameterCd = "00060", siteNumber = "05114000")
##D 
## End(Not run)



