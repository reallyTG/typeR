library(RAM)


### Name: group.heatmap.simple
### Title: Plot a Heatmap Showing OTU Abundance by Taxonomic Classification
### Aliases: group.heatmap.simple
### Keywords: hplot

### ** Examples

data(ITS1, meta)
# plot the abundance of all observed classes for each sample, 
# displaying it to the screen and adding a dendrogram on the 
# column and the Collector on the row
group.heatmap.simple(ITS1, is.OTU=TRUE, meta=meta,
                     row.factor=c(Crop="Crop"), dendro="row",
                     rank="g", top=10, drop.unclassified=TRUE,
                     leg.x=-0.06)
## Not run: 
##D # plot the genus for all OTUs, add a dendrogram to the row and 
##D # column, and save the plot in path.tiff
##D group.heatmap.simple(ITS1, is.OTU=TRUE, meta=meta, rank="genus",
##D                      dendro="both", file="my/file/path")
## End(Not run)



