library(genesysr)


### Name: fetch_accessions
### Title: Fetch accession passport data
### Aliases: fetch_accessions

### ** Examples

## Not run: 
##D   # Retrieve all accession data by country of origin
##D   accessions <- fetch_accessions(mcpd_filter(ORIGCTY = c("DEU", "SVN")))
##D 
##D   # Fetch Musa
##D   musa <- genesysr::fetch_accessions(list(taxonomy.genus = c('Musa')))
##D 
##D   # Apply selector function
##D   accessions <- fetch_accessions(mcpd_filter(ORIGCTY = c("DEU", "SVN")), selector = function(x) {
##D     list(id = x$id, acceNumb = x$acceNumb, instCode = x$institute$code)
##D   })
## End(Not run)




