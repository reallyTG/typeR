library(ape)


### Name: zoom
### Title: Zoom on a Portion of a Phylogeny
### Aliases: zoom
### Keywords: hplot

### ** Examples

## Not run: 
##D data(chiroptera)
##D zoom(chiroptera, 1:20, subtree = TRUE)
##D zoom(chiroptera, grep("Plecotus", chiroptera$tip.label))
##D zoom(chiroptera, list(grep("Plecotus", chiroptera$tip.label),
##D                       grep("Pteropus", chiroptera$tip.label)))
## End(Not run)



