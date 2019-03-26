library(edgar)


### Name: getSentiment
### Title: Provides sentiment measures of EDGAR filings
### Aliases: getSentiment

### ** Examples

## Not run: 
##D 
##D senti.df <- getSentiment(cik.no = c('1000180', '38079'), 
##D                          form.type = '10-K', filing.year = 2006) 
##D                          
##D ## Returns dataframe with sentiment measures of firms with CIKs 
##D 1000180 and 38079 filed in year 2006 for form type '10-K'.
##D 
##D senti.df <- getSentiment(cik.no = '38079', form.type = c('10-K', '10-Q'), 
##D                          filing.year = c(2005, 2006))
## End(Not run)



