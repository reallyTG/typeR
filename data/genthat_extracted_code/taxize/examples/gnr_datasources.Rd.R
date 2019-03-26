library(taxize)


### Name: gnr_datasources
### Title: Get data sources for the Global Names Resolver.
### Aliases: gnr_datasources
### Keywords: names resolve taxonomy

### ** Examples

## Not run: 
##D # all data sources
##D gnr_datasources()
##D 
##D # give me the id for EOL
##D out <- gnr_datasources()
##D out[out$title == "EOL", "id"]
##D 
##D # Fuzzy search for sources with the word zoo
##D out <- gnr_datasources()
##D out[agrep("zoo", out$title, ignore.case = TRUE), ]
##D 
##D # Output as a list
##D gnr_datasources(FALSE)
## End(Not run)



