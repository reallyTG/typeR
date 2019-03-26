library(rvertnet)


### Name: vertmap
### Title: Make a simple map to visualize VertNet data.
### Aliases: vertmap

### ** Examples

## Not run: 
##D out <- vertsearch("Junco hyemalis") # get occurrence records
##D vertmap(out)                        # map occurrence records
##D 
##D # Records are color coded by dwc term "scientificname" - sometimes unavailble
##D out <- vertsearch("mustela nigripes")
##D vertmap(input = out, mapdatabase = "state")
##D 
##D # Use searchbyterm() to match records with mapped region
##D spec <- searchbyterm(genus = "ochotona", specificepithet = "princeps", state = "california",
##D limit = 200)
##D vertmap(input = spec, mapdatabase = "state", region = "california")
##D 
##D # Many species
##D splist <- c("Accipiter erythronemius", "Aix sponsa", "Haliaeetus leucocephalus",
##D 		"Corvus corone", "Threskiornis molucca", "Merops malimbicus")
##D out <- lapply(splist, function(x) vertsearch(t=x, lim=100))
##D library("plyr")
##D out <- ldply(lapply(out, "[[", "data"))
##D vertmap(out)
##D ## jitter points
##D library("ggplot2")
##D vertmap(out, geom = geom_jitter, jitter = position_jitter(1, 6))
## End(Not run)



