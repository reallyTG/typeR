library(circlize)


### Name: highlight.chromosome
### Title: Highlight chromosomes
### Aliases: highlight.chromosome

### ** Examples

## Not run: 
##D 
##D par(mar = c(1.5, 1.5, 1.5, 1.5))
##D # highlight 
##D circos.par("track.height" = 0.1, cell.padding = c(0, 0, 0, 0))
##D circos.initializeWithIdeogram(plotType = c("axis", "labels"))
##D 
##D bed = generateRandomBed(nr = 100)
##D circos.genomicTrackPlotRegion(bed, panel.fun = function(region, value, ...) {
##D     circos.genomicPoints(region, value, pch = 16, cex = 0.5, ...)
##D })
##D 
##D bed = generateRandomBed(nr = 100)
##D circos.genomicTrackPlotRegion(bed, panel.fun = function(region, value, ...) {
##D     circos.genomicPoints(region, value, pch = 16, cex = 0.5, ...)
##D })
##D 
##D bed = generateRandomBed(nr = 100)
##D circos.genomicTrackPlotRegion(bed, panel.fun = function(region, value, ...) {
##D     circos.genomicPoints(region, value, pch = 16, cex = 0.5, ...)
##D })
##D 
##D bed = generateRandomBed(nr = 100)
##D circos.genomicTrackPlotRegion(bed, panel.fun = function(region, value, ...) {
##D     circos.genomicPoints(region, value, pch = 16, cex = 0.5, ...)
##D })
##D 
##D 
##D highlight.chromosome("chr1", col = "#FF000040", padding = c(0.05, 0.05, 0.15, 0.05))
##D highlight.chromosome("chr3", col = NA, border = "red", lwd = 2,
##D     padding = c(0.05, 0.05, 0.15, 0.05))
##D highlight.chromosome("chr5", col = "#0000FF40", track.index = c(2, 4, 5))
##D highlight.chromosome("chr7", col = NA, border = "green", lwd = 2,
##D     track.index = c(2, 4, 5))
##D circos.clear()
##D 
## End(Not run)




