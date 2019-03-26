library(Rga4gh)


### Name: search_reads
### Title: Search for Reads
### Aliases: search_reads

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D library(magrittr)
##D ## Find a dataset to search in
##D datasets <- ref_client %>% search_datasets() %>% content()
##D d_id <- datasets$datasets[[1]]$id
##D 
##D ## Find a read group to search in
##D read_group_sets <- ref_client %>% search_read_group_sets(d_id) %>% content()
##D rg_id <- read_group_sets$readGroupSets[[1]]$readGroups[[1]]$id
##D 
##D ## Find a reference_id to map reads (unmapped reads not supported yet)
##D rs_id <- ref_client %>% search_reference_sets %>% content() %>%
##D  `$`("referenceSets") %>% `[[`(1) %>% `$`("id")
##D ref_id <- ref_client %>% search_references(rs_id) %>% content() %>%
##D  `$`("references") %>% `[[`(1) %>% `$`("id")
##D 
##D ## Search for reads in the read group set
##D reads <- ref_client %>% search_reads(rg_id, reference_id = ref_id) %>% content()
##D reads
##D 
## End(Not run)




