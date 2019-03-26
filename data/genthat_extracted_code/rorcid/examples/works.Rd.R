library(rorcid)


### Name: works
### Title: Get works data
### Aliases: works

### ** Examples

## Not run: 
##D out <- works(orcid_id("0000-0002-9341-7985"))
##D out
##D out$type
##D out$path
##D 
##D works( orcid_id("0000-0002-1642-628X") )
##D works( orcid_id("0000-0003-1444-9135") )
##D works( orcid_id("0000-0003-1419-2405") )
##D 
##D out <- orcid(query="keyword:ecology")
##D works(orcid_id(out$`orcid-identifier.path`[7]))
##D works(orcid_id(out$`orcid-identifier.path`[8]))
##D works(orcid_id(out$`orcid-identifier.path`[9]))
##D works(orcid_id(out$`orcid-identifier.path`[10]))
## End(Not run)



