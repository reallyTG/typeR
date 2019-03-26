library(Rblpapi)


### Name: bdp
### Title: Run 'Bloomberg Data Point' Queries
### Aliases: bdp

### ** Examples

## Not run: 
##D   bdp(c("ESA Index", "SPY US Equity"), c("PX_LAST", "VOLUME"))
##D 
##D   ##  using overrides (cf https://github.com/Rblp/Rblpapi/issues/67)
##D   bdp("EN00 Index", "MLI_OAS", overrides=c(MLI_DATE="20150831"))
##D 
##D   ##  another override example (cf http://stackoverflow.com/a/39373019/143305)
##D   ovrd <- c("CALC_INTERVAL"="10Y", "MARKET_DATA_OVERRIDE"="PE_RATIO")
##D   bdp("SPX Index", "INTERVAL_AVG", overrides=ovrd)
## End(Not run)



