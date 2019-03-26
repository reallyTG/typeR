library(Rga4gh)


### Name: search_references
### Title: Search for References
### Aliases: search_references

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D library(magrittr)
##D ## Find a reference set to search in
##D reference_sets <- ref_client %>% search_reference_sets() %>% content()
##D rs_id <- reference_sets$referenceSets[[1]]$id
##D 
##D ## Search for references in the reference set
##D references <- ref_client %>% search_references(rs_id) %>% content()
##D references
## End(Not run)



