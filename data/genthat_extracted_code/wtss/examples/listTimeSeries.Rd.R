library(wtss)


### Name: listTimeSeries
### Title: Get list of time series
### Aliases: listTimeSeries listTimeSeries,WTSS-method

### ** Examples

## No test: 
ts.server <-  WTSS("http://www.esensing.dpi.inpe.br/wtss/")
bands <- c("ndvi","evi")
coords <- list (c(-45.00, -12.00), c(-46.00, -11.00))
tsList <- listTimeSeries(ts.server, "MOD13Q1", bands, coords, "2000-02-18", "2016-12-18")
## End(No test)



