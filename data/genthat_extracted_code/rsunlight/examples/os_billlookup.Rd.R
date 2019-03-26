library(rsunlight)


### Name: os_billlookup
### Title: Lookup bills on OpenStates.
### Aliases: os_billlookup

### ** Examples

## Not run: 
##D os_billlookup(state='ca', session=20092010, bill_id='AB 667')
##D os_billlookup(state='ca', session=20092010, bill_id='AB 667', per_page=1)
##D os_billlookup(state='ca', session=20092010, bill_id='AB 667', per_page=1, fields='id')
##D os_billlookup(state='ca', session=20092010, bill_id='AB 667',
##D    per_page=3, fields=c('id','title'))
##D os_billlookup(state='ca', session=20092010, bill_id='SB 425')
##D os_billlookup(state='ca', session=20092010, bill_id=c('AB 667','SB 425'))
##D os_billlookup(state='ca', session=20092010, bill_id='AB 667', verbose = TRUE)
## End(Not run)



