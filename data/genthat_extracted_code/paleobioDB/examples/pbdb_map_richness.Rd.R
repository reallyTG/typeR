library(paleobioDB)


### Name: pbdb_map_richness
### Title: pbdb_map_richness
### Aliases: pbdb_map_richness

### ** Examples

## Not run: 
##D data<- pbdb_occurrences (limit=1000, vocab= "pbdb", base_name="mammalia",
##D show=c("phylo","coords","ident"))
##D X11(width=13, height=7.8)
##D pbdb_map_richness (data,res=8,rank="genus")
##D pbdb_map_richness (data,res=8,rank="family")
##D ## to obtain the raster file and not plot the map
##D pbdb_map_richness (data,res=8,rank="family",do.plot=F)
## End(Not run)




