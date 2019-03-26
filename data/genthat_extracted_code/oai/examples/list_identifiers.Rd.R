library(oai)


### Name: list_identifiers
### Title: List OAI-PMH identifiers
### Aliases: list_identifiers

### ** Examples

## Not run: 
##D # from
##D recently <- format(Sys.Date() - 1, "%Y-%m-%d")
##D list_identifiers(from = recently)
##D 
##D # from and until
##D list_identifiers(from = '2011-06-01T', until = '2011-07-01T')
##D 
##D # longer time span
##D list_identifiers(from = '2011-06-01T', until = '2011-09-01T')
##D 
##D # set parameter - here, using ANDS - Australian National Data Service
##D list_identifiers(from = '2011-09-01T', until = '2012-09-01T', set = "ANDS")
## End(Not run)



