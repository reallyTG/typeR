library(edgar)


### Name: get8KItems
### Title: Retrieves Form 8-K event information
### Aliases: get8KItems

### ** Examples

## Not run: 
##D 
##D output <- get8KItems(cik.no = 38079, filing.year = 2005)
##D ## Returns 8-K events information for CIK '38079' filed in year 2005.
##D 
##D output <- get8KItems(cik.no = c(1000180,38079), 
##D                      filing.year = c(2005, 2006)) 
## End(Not run)



