library(circlize)


### Name: circos.genomicText
### Title: Draw text in a cell, specifically for genomic graphics
### Aliases: circos.genomicText

### ** Examples

## Not run: 
##D circos.par("track.height" = 0.1, cell.padding = c(0, 0, 0, 0))
##D circos.initializeWithIdeogram(plotType = NULL)
##D 
##D bed = generateRandomBed(nr = 20)
##D 
##D circos.genomicTrackPlotRegion(bed, ylim = c(0, 1), panel.fun = function(region, value, ...) {
##D     circos.genomicText(region, value, y = 0.5, labels = "text", ...)
##D })
##D 
##D bed = cbind(bed, sample(letters, nrow(bed), replace = TRUE))
##D circos.genomicTrackPlotRegion(bed, panel.fun = function(region, value, ...) {
##D     circos.genomicText(region, value, labels.column = 2, ...)
##D })
##D 
##D circos.clear()
##D 
## End(Not run)




