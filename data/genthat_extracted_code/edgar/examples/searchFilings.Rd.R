library(edgar)


### Name: searchFilings
### Title: Search EDGAR filings for specific words
### Aliases: searchFilings

### ** Examples

## Not run: 
##D 
##D word.list = c('derivative','hedging','currency forwards','currency futures')
##D output <- searchFilings(cik.no = c('1000180', '38079'), 
##D                      form.type = c("10-K", "10-K405","10KSB", "10KSB40"), 
##D                      filing.year = c(2005, 2006), word.list) 
## End(Not run)



