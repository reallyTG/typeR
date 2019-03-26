library(ConR)


### Name: EOO.computing
### Title: Extent of Occurrences
### Aliases: EOO.computing

### ** Examples

data(dataset.ex)
data(land)
## Not run: 
##D EOO <- EOO.computing(dataset.ex)
##D 
##D ## This exclude areas outside of land (i.e. ocean) for EOO computation
##D EOO <- EOO.computing(dataset.ex, 
##D   exclude.area=TRUE, country_map=land)
## End(Not run)




