library(edgar)


### Name: getBusinDescr
### Title: Retrieves business descriptions from annual statements
### Aliases: getBusinDescr

### ** Examples

## Not run: 
##D 
##D output <- getBusinDescr(cik.no = c(1000180, 38079), filing.year = 2005)
##D ## saves scrapped "Item 1" section from 10-K filings for CIKs in 
##D "Business descriptions text" directory present 
##D in the working directory. Also, it provides filing information in 
##D the output datframe.
##D 
##D output <- getBusinDescr(cik.no = c(1000180, 38079), 
##D                         filing.year = c(2005, 2006))
## End(Not run)



