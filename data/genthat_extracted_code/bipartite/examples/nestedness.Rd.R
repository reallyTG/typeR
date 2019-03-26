library(bipartite)


### Name: nestedness
### Title: Calculates nestedness temperature of presence/absence matrices
### Aliases: nestedness
### Keywords: package

### ** Examples

	## Not run: 
##D 	data(vazarr)
##D 	nestedness(vazarr) # null models are calculated
##D 	# no null models, much faster for bigger matrices:
##D 	nestedness(vazarr, null.models=FALSE) 
##D 	nestedness(vazarr, n.nulls=300, n.gen=300)
##D 	
## End(Not run)



