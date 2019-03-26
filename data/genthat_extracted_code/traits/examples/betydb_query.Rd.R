library(traits)


### Name: betydb_query
### Title: Query a BETY table
### Aliases: betydb_query betydb_search

### ** Examples

## Not run: 
##D # literal vs regular expression vs anchored regular expression:
##D betydb_query(units = "Mg", table = "variables")
##D # NULL
##D betydb_query(units = "Mg/ha", table = "variables") %>% select(name) %>% c()
##D # $name
##D # [1] "a_biomass"                  "root_live_biomass"
##D # [3] "leaf_dead_biomass_in_Mg_ha" "SDM"
##D 
##D betydb_query(genus = "Miscanthus", table = "species") %>% nrow()
##D # [1] 10
##D (betydb_query(genus = "~misc", table = "species", api_version = "beta")
##D  %>% select(genus)
##D  %>% unique() %>% c())
##D # $genus
##D # [1] "Platymiscium" "Miscanthus"   "Dermiscellum"
##D 
##D (betydb_query(genus = "~^misc", table = "species", api_version = "beta")
##D  %>% select(genus)
##D  %>% unique() %>% c())
##D # $genus
##D # [1] "Miscanthus"
## End(Not run)




