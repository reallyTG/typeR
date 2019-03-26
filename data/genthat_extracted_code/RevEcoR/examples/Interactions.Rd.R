library(RevEcoR)


### Name: Interactions
### Title: Calculating the species interactions
### Aliases: Interactions competitionIndex complementarityIndex

### ** Examples

## Not run: 
##D ## metabolic network reconstruction and seed set identity of sample data anno.species
##D net <- lapply(anno.species,reconstructGsMN)
##D seed.sets <- lapply(net, getSeedSets) 
##D seed.sets <- lapply(seed.sets, function(x)x@seeds)
##D 
##D ## calculate the complementarity index of the first species
##D complementarity.index <- complementarityIndex(net[[1]],net[[2]], 
##D  seed.sets[[1]], seed.sets[[2]])
##D competition.index <- competitionIndex(net[[1]],net[[2]], 
##D  seed.sets[[1]], seed.sets[[2]])
## End(Not run)



