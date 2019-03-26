library(edgar)


### Name: getFilingsHTML
### Title: Get HTML view of EDGAR filings
### Aliases: getFilingsHTML

### ** Examples

## Not run: 
##D 
##D output <- getFilingsHTML(cik.no = c(1000180, 38079), c('10-K','10-Q'), 
##D                          2006, quarter = c(1, 2, 3))
##D 
##D ## download '10-Q' and '10-K' filings filed by the firm with 
##D CIK = 1000180 in quarters 1,2, and 3 of the year 2006. These filings 
##D will be stored in the current working directory.
##D 
## End(Not run)



