library(Rblpapi)


### Name: bdh
### Title: Run 'Bloomberg Data History' Queries
### Aliases: bdh

### ** Examples

## Not run: 
##D   bdh("SPY US Equity", c("PX_LAST", "VOLUME"), start.date=Sys.Date()-31)
##D 
##D   ## example for an options field: request monthly data; see section A.2.4 of
##D   ##  http://www.bloomberglabs.com/content/uploads/sites/2/2014/07/blpapi-developers-guide-2.54.pdf
##D   ## for more
##D   opt <- c("periodicitySelection"="MONTHLY")
##D   bdh("SPY US Equity", c("PX_LAST", "VOLUME"),
##D       start.date=Sys.Date()-31*6, options=opt)
##D 
##D   ## example for options and overrides
##D   opt <- c("periodicitySelection" = "QUARTERLY")
##D   ovrd <- c("BEST_FPERIOD_OVERRIDE"="1GQ")
##D   bdh("IBM US Equity", "BEST_SALES", start.date=Sys.Date()-365.25*4,
##D       options=opt, overrides=ovrd)
## End(Not run)



