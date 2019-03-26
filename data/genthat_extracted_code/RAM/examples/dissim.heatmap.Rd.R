library(RAM)


### Name: dissim.heatmap
### Title: Plot Distance Matrix Heatmap for OTU Samples
### Aliases: dissim.heatmap
### Keywords: hplot

### ** Examples

data(ITS1, meta)
# plot to the screen with one meta factor and standard
# calculation methods
dissim.heatmap(ITS1, is.OTU=TRUE, meta=meta, 
               row.factor=c(Plot="Plots"))
## Not run: 
##D # plot the heatmap to a .tiff file using Hellinger 
##D # standardization and Manhattan distances
##D dissim.heatmap(ITS1, dissim.method="manhattan",
##D                stand.method="hellinger",
##D                file="my/sample/path", ext="tiff")
## End(Not run)



