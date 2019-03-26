library(paleobioDB)


### Name: pbdb_orig_ext
### Title: pbdb_orig_ext
### Aliases: pbdb_orig_ext

### ** Examples

## Not run: 
##D canidae<-  pbdb_occurrences (limit="all", vocab="pbdb",
##D base_name="Canidae", show=c("phylo", "ident"))
##D 
##D # plot of the evolutive rates.
##D pbdb_orig_ext (canidae, rank="genus", temporal_extent=c(0, 10), 
##D res=1, orig_ext=1) 
##D 
##D # plot of the extinction rates.
##D pbdb_orig_ext (canidae, rank="species", temporal_extent=c(0, 10), 
##D res=1, orig_ext=2) 
## End(Not run)



