library(RAM)


### Name: factor.abundance
### Title: Plot the Abundance of OTUs by Classification at a Given
###   Taxonomic Rank For Each Level of A Metadata Category Variable.
### Aliases: factor.abundance
### Keywords: hplot

### ** Examples

data(ITS1, ITS2, meta)
data=list(ITS1=ITS1, ITS2=ITS2)
# plot the relative abundance at the class level to the screen,
# ignoring the unclassified
factor.abundance(data=data, rank="family", meta=meta,
                 meta.factor=c("Crop"), top=20,
                 drop.unclassified=TRUE)
## Not run: 
##D # plot the count abundance at the phylum level to path.tiff
##D factor.abundance(data=data, rank="family", meta=meta,
##D                  meta.factor=c("Crop"), top=20, count=FALSE,
##D                  drop.unclassified=TRUE, main="",
##D                  file="path/to/tiff", ext="tiff", 
##D                  height=8, width=12)
## End(Not run)



