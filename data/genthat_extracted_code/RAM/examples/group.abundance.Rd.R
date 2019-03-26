library(RAM)


### Name: group.abundance
### Title: Plot the Abundance of OTUs by Classification at a Given
###   Taxonomic Rank
### Aliases: group.abundance
### Keywords: hplot

### ** Examples

data(ITS1, ITS2)
# plot the relative abundance at the class level to the screen, 
# ignoring the unclassified
group.abundance(data=list(ITS1=ITS1), rank="phylum",
                drop.unclassified=TRUE)
## Not run: 
##D # plot the count abundance at the phylum level to path.tiff
##D group.abundance(data=list(ITS1=ITS1, ITS2=ITS2), rank="g",
##D                 top=10, count=FALSE, drop.unclassified=TRUE,
##D                 main="", file=NULL, ext=NULL,
##D                 height=8, width=16, bw=FALSE, ggplot=TRUE)
## End(Not run)



