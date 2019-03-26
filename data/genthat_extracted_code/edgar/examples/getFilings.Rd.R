library(edgar)


### Name: getFilings
### Title: Retrieves EDGAR filings from SEC site.
### Aliases: getFilings

### ** Examples

## Not run: 
##D 
##D report <- getFilings(1994, 100030, 'ALL') 
##D ## download all filings filed by the firm with CIK=100030 in the year 1994. 
##D ## Generates download report in dataframe.
##D 
##D report <- getFilings(2006, 1000180, '10-K')
##D ## download '10-K' filings filed by the firm with CIK=1000180 in the year 2006. 
##D ## Generates download report in dataframe.
## End(Not run)




