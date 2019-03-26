library(RJSDMX)


### Name: getTimeSeriesTable
### Title: get time series and return a data.frame
### Aliases: getTimeSeriesTable

### ** Examples

## Not run: 
##D   # get single time series: EXR.A.USD.EUR.SP00.A (alternatively: EXR/A+M.USD.EUR.SP00.A)
##D   my_df=getTimeSeriesTable('ECB','EXR.A.USD.EUR.SP00.A')
##D   
##D   # get monthly and annual frequency: 'EXR.A|M.USD.EUR.SP00.A' 
##D   #                   (alternatively:  EXR/A+M.USD.EUR.SP00.A)
##D   my_df=getTimeSeriesTable('ECB','EXR.A|M.USD.EUR.SP00.A')
##D 
##D   # get all available frequencies: 'EXR.*.USD.EUR.SP00.A'
##D   #                 (alternatively: EXR/.USD.EUR.SP00.A)
##D   my_df=getTimeSeriesTable('ECB','EXR.*.USD.EUR.SP00.A')
## End(Not run)



