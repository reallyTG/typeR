library(paleobioDB)


### Name: paleobioDB
### Title: paleobioDB: An R-package for downloading, visualizing and
###   processing data from the Paleobiology Database
### Aliases: paleobioDB paleobioDB-package
### Keywords: package

### ** Examples

## Not run: 
##D 
##D canidae<-  pbdb_occurrences (limit="all", base_name="canidae", 
##D interval="Quaternary", show=c("coords", "phylo", "ident"))
##D 
##D ## to explore the number of subtaxa
##D pbdb_subtaxa (canidae)
##D 
##D ## to explore the temporal resolution of the fossil records
##D pbdb_temporal_resolution (canidae)
##D 
##D ## returns a dataframe and a plot with the temporal span 
##D ##  of the species, genera, etc.
##D pbdb_temp_range (canidae, rank= "genus", names=FALSE)
##D 
##D ## returns a dataframe and a plot showing the species, genera, etc. 
##D richness across time
##D pbdb_richness (canidae, rank= "species", 
##D temporal_extent= c (0,10), res= 1)
##D 
##D ## returns a dataframe and a plot showing the evolutionary 
##D and extinction rates across time
##D 
##D ## evolutionary rates= evo_ext=1
##D pbdb_orig_ext (canidae, rank="species", temporal_extent=c(0, 10),
##D res=1, orig_ext=1)
##D 
##D ## extinction rates= evo_ext=2
##D pbdb_orig_ext (canidae, rank="species", temporal_extent=c(0, 10),
##D               res=1, orig_ext=2)
##D 
##D ## maps the fossil occurrences
##D pbdb_map (canidae, main = "Canidae", pch= 19, cex=0.7)
##D 
##D ## maps the sampling effort
##D pbdb_map_occur (canidae, res= 5)
##D 
##D ## maps the species, genera, etc. richness
##D pbdb_map_richness (canidae, rank="species", res= 5)
##D 
## End(Not run)




