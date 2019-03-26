library(Rga4gh)


### Name: search_reference_sets
### Title: Search for Reference Sets
### Aliases: search_reference_sets

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D library(magrittr)
##D ## Search for reference sets
##D reference_sets <- ref_client %>% search_reference_sets() %>% content()
##D reference_sets
## End(Not run)



