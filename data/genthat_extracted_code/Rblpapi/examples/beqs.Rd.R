library(Rblpapi)


### Name: beqs
### Title: Run 'Bloomberg EQS' Queries
### Aliases: beqs

### ** Examples

## Not run: 
##D head(beqs("Global Oil Companies YTD Return"), 20)
##D head(beqs("Global Oil Companies YTD Return", "GLOBAL"), 20)
##D head(beqs("Global Oil Companies YTD Return", "GLOBAL", "GERMAN"), 20)
##D head(beqs("Global Oil Companies YTD Return", "GLOBAL", "GERMAN", "GENERAL"), 20)
##D head(beqs("Global Oil Companies YTD Return", "GLOBAL", "ENGLISH", "GENERAL",
##D           as.Date("2015-09-30")), 20)
## End(Not run)



