library(taxize)


### Name: upstream
### Title: Retrieve the upstream taxa for a given taxon name or ID.
### Aliases: upstream upstream.default upstream.tsn upstream.colid
###   upstream.ids

### ** Examples

## Not run: 
##D ## col
##D ### get all genera at one level up
##D upstream("Pinus contorta", db = 'col', upto = 'genus')
##D ### goes to same level, Abies is a genus
##D upstream("Abies", db = 'col', upto = 'genus')
##D upstream('Pinus contorta', db = 'col', upto = 'family')
##D upstream('Poa annua', db = 'col', upto = 'family')
##D upstream('Poa annua', db = 'col', upto = 'order')
##D 
##D ## itis
##D upstream(x='Pinus contorta', db = 'itis', upto = 'genus')
##D 
##D ## both
##D upstream(get_ids('Pinus contorta', db = c('col','itis')), upto = 'genus')
##D 
##D # Use rows parameter to select certain
##D upstream('Poa annua', db = 'col', upto = 'genus')
##D upstream('Poa annua', db = 'col', upto = 'genus', rows=1)
##D 
##D # use curl options
##D res <- upstream('Poa annua', db = 'col', upto = 'genus', verbose = TRUE)
## End(Not run)



