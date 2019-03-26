library(wosr)


### Name: query_wos
### Title: Query the Web of Science
### Aliases: query_wos

### ** Examples

## Not run: 
##D 
##D # Get session ID and reuse it across queries:
##D sid <- auth("some_username", password = "some_password")
##D 
##D query_wos("TS = (\"dog welfare\") AND PY = (1990-2007)", sid = sid)
##D 
##D # Finds records in which Max Planck appears in the address field.
##D query_wos("AD = Max Planck", sid = sid)
##D 
##D # Finds records in which Max Planck appears in the same address as Mainz
##D query_wos("AD = (Max Planck SAME Mainz)", sid = sid)
## End(Not run)



