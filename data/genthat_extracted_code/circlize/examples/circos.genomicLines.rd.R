library(circlize)


### Name: circos.genomicLines
### Title: Add lines to a plotting region, specifically for genomic
###   graphics
### Aliases: circos.genomicLines

### ** Examples

## Not run: 
##D 
##D ### test bed
##D circos.par("track.height" = 0.1)
##D circos.initializeWithIdeogram(plotType = NULL)
##D 
##D bed = generateRandomBed(nr = 100)
##D circos.genomicTrackPlotRegion(bed, panel.fun = function(region, value, ...) {
##D     circos.genomicLines(region, value, type = "l", ...)
##D })
##D 
##D bed1 = generateRandomBed(nr = 100)
##D bed2 = generateRandomBed(nr = 100)
##D bed_list = list(bed1, bed2)
##D 
##D circos.genomicTrackPlotRegion(bed_list, panel.fun = function(region, value, ...) {
##D     i = getI(...)
##D     circos.genomicLines(region, value, col = i, ...)
##D })
##D 
##D circos.genomicTrackPlotRegion(bed_list, stack = TRUE, 
##D     panel.fun = function(region, value, ...) {
##D     i = getI(...)
##D     circos.genomicLines(region, value, col = i, ...)
##D })
##D 
##D bed = generateRandomBed(nr = 100, nc = 4)
##D circos.genomicTrackPlotRegion(bed, panel.fun = function(region, value, ...) {
##D     circos.genomicLines(region, value, col = 1:4, ...)
##D })
##D 
##D circos.genomicTrackPlotRegion(bed, stack = TRUE, panel.fun = function(region, value, ...) {
##D     i = getI(...)
##D     circos.genomicLines(region, value, col = i, ...)
##D })
##D 
##D bed = generateRandomBed(nr = 100)
##D circos.genomicTrackPlotRegion(bed, panel.fun = function(region, value, ...) {
##D     circos.genomicLines(region, value, type = "segment", lwd = 2, ...)
##D })
##D 
##D circos.clear()
##D 
## End(Not run)




