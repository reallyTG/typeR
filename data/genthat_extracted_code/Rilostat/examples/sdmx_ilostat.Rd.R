library(Rilostat)


### Name: sdmx_ilostat
### Title: Read Ilostat Data, Metadata via ILO DSMX api
### Aliases: sdmx_ilostat

### ** Examples

## Not run: 
##D ########## get codelist
##D # fetch collection define on ILOSTAT
##D dic <- sdmx_ilostat(dsd = "CL_COLLECTION", lang ="en")
##D head(dic)
##D 
##D # fetch country available on ILOSTAT
##D dic <- sdmx_ilostat(dsd = "CL_COUNTRY", lang ="es")
##D head(dic)
##D 
##D # fetch indicator define in collection STI
##D sdmx_ilostat(dsd = "CL_INDICATOR_STI", lang ="fr")
##D head(dic)
##D 
##D ########## get data
##D 
##D ### with attribute
##D dat <- sdmx_ilostat(dsd = 'STI_ALB_EMP_TEMP_SEX_AGE_NB', 
##D                     sdmx_resource = 'data')
##D head(dat)
##D 
##D # without attribute
##D dat <- sdmx_ilostat(dsd = "STI_DEU_EMP_TEMP_SEX_AGE_NB?detail=dataonly", 
##D                     sdmx_resource = 'data')
##D 
##D # of last N data
##D dat <- sdmx_ilostat(dsd = "STI_ITA_EMP_TEMP_SEX_AGE_NB?lastNObservations=1",
##D                     sdmx_resource = 'data')
##D head(dat)
##D 
##D # of first N data
##D dat <- sdmx_ilostat(dsd = "STI_ARG_EMP_TEMP_SEX_AGE_NB?firstNObservations=2", 
##D                     sdmx_resource = 'data')
##D head(dat)
##D 
##D ######## with multi country and advanced filters
##D 
##D # to get the order of the filter first get the conceptref of the DSD
##D 
##D filter_position <- sdmx_ilostat(dsd = 'STI_ALL_EMP_TEMP_SEX_AGE_NB', 
##D 					   sdmx_resource = 'conceptref')
##D filter_position
##D 
##D # COUNTRY and FREQ are in second and third position of the filters
##D 
##D dat <- sdmx_ilostat(dsd = "STI_ALL_EMP_TEMP_SEX_AGE_NB/.FRA+DEU.M....", 
##D                     sdmx_resource = 'data')
##D head(dat)
##D 
##D # check availability of time series	
##D dat <- sdmx_ilostat(dsd = "STI_CHL_EMP_TEMP_SEX_AGE_NB/......?detail=serieskeysonly", 
##D                     sdmx_resource = 'data')
##D head(dat)
##D 
##D # as from 2009
##D sdmx_ilostat("STI_ZAF_EMP_TEMP_SEX_AGE_NB/......?startPeriod=2009-01-01&detail=serieskeysonly",
##D                     sdmx_resource = 'data')
##D 
##D # as from 2009
##D dat <- sdmx_ilostat("STI_FRA_UNE_TUNE_SEX_AGE_NB/STI.FRA.M.48..", 
##D                     sdmx_resource = 'data')
##D head(dat)
##D 
##D ########## dataflow available
##D 
##D flow <- sdmx_ilostat("STI_TTO_MULTI", sdmx_resource = 'dataflow')
##D 
##D flow <- sdmx_ilostat("KI_ALL_EMP_MULTI", sdmx_resource = 'dataflow')
##D 
##D flow <- sdmx_ilostat("YI_FRA_UNE_MULTI", sdmx_resource = 'dataflow')
##D 
##D ########## count data available
##D 
##D # with multi country
##D sdmx_ilostat("STI_FRA_UNE_TUNE_SEX_AGE_NB/STI.FRA.M.48..", 
##D                      sdmx_resource = 'data', count = TRUE)
##D 
## End(Not run)



