library(rotl)


### Name: ott_id.match_names
### Title: 'ott_id' and 'flags' for taxonomic names matched by
###   'tnrs_match_names'
### Aliases: ott_id.match_names flags.match_names flags

### ** Examples

## Not run: 
##D   rsp <- tnrs_match_names(c("Diadema", "Tyrannosaurus"))
##D   rsp$ott_id    # ott id for match currently in use
##D   ott_id(rsp)   # similar as above but elements are named
##D 
##D   ## flags() is useful for instance to determine if a taxon is extinct
##D   flags(rsp, taxon_name="Tyrannosaurus")
## End(Not run)



