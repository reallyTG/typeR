library(bold)


### Name: bold_stats
### Title: Get BOLD stats
### Aliases: bold_stats

### ** Examples

## Not run: 
##D x <- bold_stats(taxon='Osmia')
##D x$total_records
##D x$records_with_species_name
##D x$bins
##D x$countries
##D x$depositories
##D x$order
##D x$family
##D x$genus
##D x$species
##D 
##D # just get all counts
##D lapply(Filter(is.list, x), "[[", "count")
##D 
##D res <- bold_stats(taxon='Osmia', response=TRUE)
##D res$url
##D res$status_code
##D res$response_headers
##D 
##D # More than 1 can be given for all search parameters
##D bold_stats(taxon=c('Coelioxys','Osmia'))
##D 
##D ## curl debugging
##D ### These examples below take a long time, so you can set a timeout so that 
##D ### it stops by X sec
##D bold_stats(taxon='Osmia', verbose = TRUE)
##D # bold_stats(geo='Costa Rica', timeout_ms = 6)
## End(Not run)



