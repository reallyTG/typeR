library(RJSDMX)


### Name: getTimeSeries
### Title: get time series
### Aliases: getTimeSeries

### ** Examples

## Not run: 
##D ## get single time series: EXR.A.USD.EUR.SP00.A (or: EXR/A+M.USD.EUR.SP00.A)
##D my_ts=getTimeSeries('ECB','EXR.A.USD.EUR.SP00.A')
##D ## get monthly and annual frequency: 'EXR.A|M.USD.EUR.SP00.A' (or: EXR/A+M.USD.EUR.SP00.A)
##D my_ts=getTimeSeries('ECB','EXR.A|M.USD.EUR.SP00.A')
##D ## get all available frequencies: 'EXR.*.USD.EUR.SP00.A' (or: EXR/.USD.EUR.SP00.A)
##D my_ts=getTimeSeries('ECB','EXR.*.USD.EUR.SP00.A')
## End(Not run)



