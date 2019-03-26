library(circlize)


### Name: circos.genomicPoints
### Title: Add points to a plotting region, specifically for genomic
###   graphics
### Aliases: circos.genomicPoints

### ** Examples

## Not run: 
##D 
##D circos.par("track.height" = 0.1)
##D circos.initializeWithIdeogram(plotType = NULL)
##D 
##D bed = generateRandomBed(nr = 100)
##D circos.genomicTrackPlotRegion(bed, panel.fun = function(region, value, ...) {
##D     circos.genomicPoints(region, value, pch = 16, cex = 0.5, ...)
##D })
##D 
##D circos.genomicTrackPlotRegion(bed, stack = TRUE, panel.fun = function(region, value, ...) {
##D     circos.genomicPoints(region, value, pch = 16, cex = 0.5, ...)
##D     i = getI(...)
##D     cell.xlim = get.cell.meta.data("cell.xlim")
##D     circos.lines(cell.xlim, c(i, i), lty = 2, col = "#00000040")
##D })
##D 
##D bed1 = generateRandomBed(nr = 100)
##D bed2 = generateRandomBed(nr = 100)
##D bed_list = list(bed1, bed2)
##D 
##D # data frame list
##D circos.genomicTrackPlotRegion(bed_list, panel.fun = function(region, value, ...) {
##D     cex = (value[[1]] - min(value[[1]]))/(max(value[[1]]) - min(value[[1]]))
##D     i = getI(...)
##D     circos.genomicPoints(region, value, cex = cex, pch = 16, col = i, ...)
##D })
##D 
##D circos.genomicTrackPlotRegion(bed_list, stack = TRUE,
##D     panel.fun = function(region, value, ...) {
##D     cex = (value[[1]] - min(value[[1]]))/(max(value[[1]]) - min(value[[1]]))
##D     i = getI(...)
##D     circos.genomicPoints(region, value, cex = cex, pch = 16, col = i, ...)
##D     cell.xlim = get.cell.meta.data("cell.xlim")
##D     circos.lines(cell.xlim, c(i, i), lty = 2, col = "#00000040")
##D })
##D 
##D 
##D bed = generateRandomBed(nr = 100, nc = 4)
##D circos.genomicTrackPlotRegion(bed, panel.fun = function(region, value, ...) {
##D     cex = (value[[1]] - min(value[[1]]))/(max(value[[1]]) - min(value[[1]]))
##D     circos.genomicPoints(region, value, cex = 0.5, pch = 16, col = 1:4, ...)
##D })
##D 
##D circos.genomicTrackPlotRegion(bed, stack = TRUE, panel.fun = function(region, value, ...) {
##D     cex = (value[[1]] - min(value[[1]]))/(max(value[[1]]) - min(value[[1]]))
##D     i = getI(...)
##D     circos.genomicPoints(region, value, cex = cex, pch = 16, col = i, ...)
##D     cell.xlim = get.cell.meta.data("cell.xlim")
##D     circos.lines(cell.xlim, c(i, i), lty = 2, col = "#00000040")
##D })
##D 
##D circos.clear()
##D 
## End(Not run)




