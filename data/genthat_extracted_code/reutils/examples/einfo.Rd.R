library(reutils)


### Name: einfo
### Title: einfo - getting database statistics and search fields
### Aliases: einfo

### ** Examples

## Not run: 
##D ## Fetch a list of all current Entrez database names
##D einfo()
##D 
##D ## Fetch statistics for an Entrez database and parse
##D ## the data into a data.frame
##D x <- einfo("gene")
##D if (x$no_errors()) {
##D   content(x, "parsed")
##D }
##D 
##D 
##D 
##D ## Fetch statistics for an Entrez database in JSON format
##D ## and parse the data into a list
##D x <- einfo("pubmed", retmode = "json")
##D if (x$no_errors()) {
##D   content(x, "parsed")
##D }
## End(Not run)



