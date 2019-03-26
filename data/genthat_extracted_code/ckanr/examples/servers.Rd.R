library(ckanr)


### Name: servers
### Title: CKAN server URLS and other info
### Aliases: servers

### ** Examples

## Not run: 
##D servers()
##D ckan_info("http://data.gov.au/")
##D ckan_info(servers()[5])
##D 
##D # what version is each CKAN server running
##D out <- lapply(servers()[1:6], ckan_info)
##D vapply(out, "[[", "", "ckan_version")
## End(Not run)



