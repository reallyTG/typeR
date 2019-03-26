library(RWildbook)


### Name: searchWB
### Title: Pull data from the Wildbook framework.
### Aliases: searchWB

### ** Examples

## Not run: 
##D ## The following examples conduct the same search.
##D ## You will need to supply your own login information for whaleshark.org to
##D ## run these examples.
##D 
##D ## Search using filter arguments
##D data1 <- searchWB(username="username",
##D                   password="password",
##D                   baseURL ="whaleshark.org",
##D                   object="Encounter",
##D                   individualID=c("A-001"))
##D 
##D ## Search using existing JDOQL string
##D jdoql <- "SELECT FROM org.ecocean.Encounter WHERE individualID == 'A-001'"
##D 
##D data2 <- searchWB(username="username",
##D                   password="password",
##D                   baseURL ="whaleshark.org",
##D                   jdoql=jdoql)
##D 
##D ## Search using existing URL
##D WBurl <- paste0("http://username:password@whaleshark.org/rest/jdoql?",jdoql)
##D 
##D data3 <- searchWB(searchURL = WBurl)
## End(Not run)




