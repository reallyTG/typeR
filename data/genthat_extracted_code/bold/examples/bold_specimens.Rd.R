library(bold)


### Name: bold_specimens
### Title: Search BOLD for specimens.
### Aliases: bold_specimens

### ** Examples

## Not run: 
##D bold_specimens(taxon='Osmia')
##D bold_specimens(taxon='Osmia', format='xml')
##D bold_specimens(taxon='Osmia', response=TRUE)
##D res <- bold_specimens(taxon='Osmia', format='xml', response=TRUE)
##D res$url
##D res$status_code
##D res$response_headers
##D 
##D # More than 1 can be given for all search parameters
##D bold_specimens(taxon=c('Coelioxys','Osmia'))
##D 
##D ## curl debugging
##D ### These examples below take a long time, so you can set a timeout so that 
##D ### it stops by X sec
##D head(bold_specimens(taxon='Osmia', verbose = TRUE))
##D # head(bold_specimens(geo='Costa Rica', timeout_ms = 6))
## End(Not run)



