library(taxize)


### Name: ping
### Title: Ping an API used in taxize to see if it's working.
### Aliases: ping col_ping eol_ping itis_ping ncbi_ping tropicos_ping
###   nbn_ping gbif_ping bold_ping ipni_ping vascan_ping fg_ping

### ** Examples

## Not run: 
##D col_ping()
##D col_ping("content")
##D col_ping(200)
##D col_ping("200")
##D col_ping(204)
##D 
##D itis_ping()
##D eol_ping()
##D ncbi_ping()
##D tropicos_ping()
##D nbn_ping()
##D 
##D gbif_ping()
##D gbif_ping(200)
##D 
##D bold_ping()
##D bold_ping(200)
##D bold_ping("content")
##D 
##D ipni_ping()
##D ipni_ping(200)
##D ipni_ping("content")
##D 
##D vascan_ping()
##D vascan_ping(200)
##D vascan_ping("content")
##D 
##D # curl options
##D library("httr")
##D vascan_ping(config=verbose())
##D eol_ping(500, config=verbose())
## End(Not run)



