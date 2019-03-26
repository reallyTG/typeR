library(edgar)


### Name: getMgmtDisc
### Title: Retrieves management's discussion and analysis section
### Aliases: getMgmtDisc

### ** Examples

## Not run: 
##D 
##D output <- getMgmtDisc(cik.no = c(1000180, 38079), filing.year = 2005)
##D 
##D ## saves scrapped "Item 7" section from 10-K filings for CIKs in 
##D "MD&A section text" directory present in the working directory. 
##D Also, it provides filing information in the output datframe.
##D 
##D output <- getMgmtDisc(cik.no = c(1000180, 38079), 
##D                       filing.year = c(2005, 2006))
## End(Not run)



