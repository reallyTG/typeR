library(taxize)


### Name: gnr_resolve
### Title: Resolve names using Global Names Resolver.
### Aliases: gnr_resolve
### Keywords: names resolve taxonomy

### ** Examples

## Not run: 
##D gnr_resolve(names = c("Helianthus annuus", "Homo sapiens"))
##D gnr_resolve(names = c("Asteraceae", "Plantae"))
##D 
##D # Using data source 12 (Encyclopedia of Life)
##D sources <- gnr_datasources()
##D sources
##D eol <- sources$id[sources$title == 'EOL']
##D gnr_resolve(names=c("Helianthos annuus","Homo sapians"), data_source_ids=eol)
##D 
##D # Two species in the NE Brazil catalogue
##D sps <- c('Justicia brasiliana','Schinopsis brasiliensis')
##D gnr_resolve(names = sps, data_source_ids = 145)
##D 
##D # Best match only, compare the two
##D gnr_resolve(names = "Helianthus annuus", best_match_only = FALSE)
##D gnr_resolve(names = "Helianthus annuus", best_match_only = TRUE)
##D 
##D # Preferred data source
##D gnr_resolve(names = "Helianthus annuus", preferred_data_sources = c(3,4))
##D 
##D # Return canonical names - default is canonical=FALSE
##D head(gnr_resolve(names = "Helianthus annuus"))
##D head(gnr_resolve(names = "Helianthus annuus", canonical=TRUE))
##D 
##D # Return canonical names with authority stripped but
##D # ranks still present
##D gnr_resolve("Scorzonera hispanica L. subsp. asphodeloides Wallr.")
##D ## vs.
##D gnr_resolve("Scorzonera hispanica L. subsp. asphodeloides Wallr.",
##D    with_canonical_ranks = TRUE)
## End(Not run)



