library(TSsdmx)


### Name: verifyQuery
### Title: Check Query Against a Provider
### Aliases: verifyQuery
### Keywords: ts

### ** Examples

## Not run: 
##D   print(verifyQuery('IMFx', 'PGI.CA.*.*.*.*'))# returns FALSE
##D 
##D   print(verifyQuery('IMF', 'PGI.CA.*.*.*.*', verbose = FALSE)) # returns TRUE
##D 
##D   print(verifyQuery('IMF', 'PGI.CAN.*.*.*.*'))# returns FALSE 
##D 
##D   #print(verifyQuery('NBB', 'HICP.000000.*.*'))
##D   #print(verifyQuery('NBB', 'HICP.000000.BE.M'))
##D   
## End(Not run)



