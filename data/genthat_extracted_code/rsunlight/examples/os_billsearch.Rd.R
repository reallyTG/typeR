library(rsunlight)


### Name: os_billsearch
### Title: Search OpenStates bills.
### Aliases: os_billsearch

### ** Examples

## Not run: 
##D os_billsearch(terms = 'agriculture', state = 'tx')
##D os_billsearch(terms = 'agriculture', state = 'tx', chamber = 'upper')
##D os_billsearch(terms = 'taxi', state = 'dc')
##D os_billsearch(terms = 'taxi', state = 'dc', per_page=3)
##D os_billsearch(terms = 'taxi', state = 'dc', per_page=3, sort='created_at')
##D os_billsearch(terms = 'taxi', state = 'dc', type='resolution')
##D 
##D # Search window
##D os_billsearch(terms = 'climate change', search_window='term')
##D os_billsearch(terms = 'climate change', search_window='term:2009-2011')
##D os_billsearch(terms = 'climate change', search_window='session')
##D os_billsearch(terms = 'climate change', search_window='session:2009')
##D 
##D os_billsearch(terms = 'agriculture', state = 'tx', per_page=2)
##D os_billsearch(terms = 'agriculture', state = 'tx', per_page=2, page=2)
##D os_billsearch(terms = 'agriculture', state = 'tx', fields=c('id','created_at'), per_page=10)
##D 
##D # Pass in more than one value for some parameters
##D os_billsearch(terms = 'agriculture', state = c('tx', 'or'))
##D os_billsearch(terms = 'agriculture', state = "or", chamber = c('upper', 'lower'))
## End(Not run)



