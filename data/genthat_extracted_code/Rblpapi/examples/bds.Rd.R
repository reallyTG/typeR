library(Rblpapi)


### Name: bds
### Title: Run 'Bloomberg Data Set' Queries
### Aliases: bds

### ** Examples

## Not run: 
##D   ## simple query
##D   bds("GOOG US Equity", "TOP_20_HOLDERS_PUBLIC_FILINGS")
##D   ## example of using overrides
##D   overrd <- c("START_DT"="20150101", "END_DT"="20160101")
##D   bds("CPI YOY Index","ECO_RELEASE_DT_LIST", overrides = overrd)
## End(Not run)



