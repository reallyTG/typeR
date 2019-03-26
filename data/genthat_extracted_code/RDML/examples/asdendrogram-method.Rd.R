library(RDML)


### Name: RDML.AsDendrogram
### Title: Represents structure of 'RDML' file as dendrogram
### Aliases: RDML.AsDendrogram
### Keywords: manip

### ** Examples

## Not run: 
##D PATH <- path.package("RDML")
##D filename <- paste(PATH, "/extdata/", "BioRad_qPCR_melt.rdml", sep ="")
##D cfx96 <- RDML$new(filename)
##D #plot dendrogram
##D cfx96$AsDendrogram()
##D #assign dendrogram to the object
##D dendr <- cfx96$AsDendrogram(plot.dendrogram = FALSE)
## End(Not run)



