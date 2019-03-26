library(rdatacite)


### Name: dc_oai_getrecord
### Title: Retrieve an individual record from the DataCite repository
### Aliases: dc_oai_getrecord

### ** Examples

## Not run: 
##D # you can pass in just the numeric part of the ID
##D dc_oai_getrecord(56225)
##D dc_oai_getrecord(c(56225, 6667400))
##D 
##D # Or, the entire thing
##D dc_oai_getrecord("oai:oai.datacite.org:56225")
##D 
##D # Or, mixed
##D dc_oai_getrecord(c("56225", "oai:oai.datacite.org:6667400"))
##D 
##D today <- format(Sys.Date(), "%Y-%m-%d")
##D temp <- dc_oai_listidentifiers(from = today)
##D dc_oai_getrecord(temp$identifier[1:2])
## End(Not run)



