library(Rga4gh)


### Name: search_reference_bases
### Title: Search for Reference Bases
### Aliases: search_reference_bases

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D library(magrittr)
##D ## Find a reference set to search in
##D reference_sets <- ref_client %>% search_reference_sets() %>% content()
##D rs_id <- reference_sets$referenceSets[[1]]$id
##D 
##D ## Find a reference to search in
##D references <- ref_client %>% search_references(rs_id) %>% content()
##D ref_id <- references$references[[1]]$id
##D 
##D ## Find a string of bases from 10000 -> 11000
##D reference_bases <- ref_client %>%
##D  search_reference_bases(ref_id, start = 10000, end = 11000) %>% content()
##D reference_bases
## End(Not run)



