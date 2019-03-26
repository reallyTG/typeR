library(RAM)


### Name: group.abundance.meta
### Title: Plot the Abundance of OTUs by Classification at a Given
###   Taxonomic Rank
### Aliases: group.abundance.meta
### Keywords: hplot

### ** Examples

data(ITS1, ITS2, meta)
## Not run: 
##D # plot the relative abundance at the class level to the screen, 
##D # drop unclassified taxa
##D data=list(ITS1=ITS1, ITS2=ITS2)
##D group.abundance.meta(data, top=10, rank="family", 
##D                     drop.unclassified=TRUE, meta=meta, 
##D                     meta.factor=c("Crop", "City"))
## End(Not run)



