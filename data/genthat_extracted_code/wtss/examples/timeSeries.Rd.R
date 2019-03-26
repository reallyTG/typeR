library(wtss)


### Name: timeSeries
### Title: Get time series
### Aliases: timeSeries timeSeries,WTSS-method

### ** Examples

## No test: 
ts.server = WTSS("http://www.esensing.dpi.inpe.br/wtss/")
ts = timeSeries(ts.server, "MOD13Q1", c("ndvi","evi"), 
                longitude = -45.00, latitude  = -12.00,
                start_date = "2000-02-18", end_date = "2016-12-18")
## End(No test)



