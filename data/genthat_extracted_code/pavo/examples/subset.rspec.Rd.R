library(pavo)


### Name: subset.rspec
### Title: Subset rspec, vismodel, and colspace objects
### Aliases: subset.rspec subset.colspace subset.vismodel

### ** Examples

## Not run: 
##D data(sicalis)
##D vis.sicalis <- vismodel(sicalis)
##D tcs.sicalis <- colspace(vis.sicalis, space = 'tcs')
##D 
##D # Subset all 'crown' patches (C in file names)
##D head(subset(sicalis, "C"))
##D subset(vis.sicalis, "C")
##D subset(tcs.sicalis, "C")[, 1:5]
##D subset(sicalis, c("B","C"))
##D subset(sicalis, "T", invert=TRUE)
## End(Not run)




