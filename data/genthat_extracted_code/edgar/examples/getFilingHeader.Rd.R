library(edgar)


### Name: getFilingHeader
### Title: Scrape EDGAR filing header information
### Aliases: getFilingHeader

### ** Examples

## Not run: 
##D 
##D header.df <- getFilingHeader(cik.no = c('1000180', '38079'), 
##D                          form.type = '10-K', filing.year = 2006) 
##D               
##D header.df <- getFilingHeader(cik.no = '38079', c('10-K', '10-Q'), 
##D                          filing.year = c(2005, 2006))
## End(Not run)



