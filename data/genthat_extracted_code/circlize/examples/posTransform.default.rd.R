library(circlize)


### Name: posTransform.default
### Title: Genomic position transformation function
### Aliases: posTransform.default

### ** Examples

## Not run: 
##D 
##D par(mfrow = c(2, 1))
##D ### rect matrix
##D circos.par(cell.padding = c(0, 0, 0, 0))
##D circos.initializeWithIdeogram()
##D 
##D bed = generateRandomBed(nr = 100, nc = 4)
##D 
##D circos.genomicPosTransformLines(bed, posTransform = posTransform.default,
##D     horizontalLine = "top", track.height = 0.1)
##D 
##D f = colorRamp2(breaks = c(-1, 0, 1), colors = c("green", "black", "red"))
##D circos.genomicTrackPlotRegion(bed, stack = TRUE, panel.fun = function(region, value, ...) {
##D     circos.genomicRect(region, value, col = f(value[[1]]), 
##D         border = f(value[[1]]), posTransform = posTransform.default, ...)
##D }, bg.border = NA)
##D 
##D circos.clear()
##D 
##D 
##D circos.par(cell.padding = c(0, 0, 0, 0))
##D circos.initializeWithIdeogram(plotType = NULL)
##D 
##D bed = generateRandomBed(nr = 20, nc = 4)
##D 
##D circos.genomicTrackPlotRegion(bed, ylim = c(0, 1), panel.fun = function(region, value, ...) {
##D     circos.genomicText(region, value, y = 0, adj = c(1, 0.5), labels = "gene",
##D         facing = "reverse.clockwise", posTransform = posTransform.default)
##D }, bg.border = NA)
##D 
##D circos.genomicPosTransformLines(bed, posTransform = posTransform.default,
##D     horizontalLine = "bottom", direction = "outside", track.height = 0.1)
##D 
##D cytoband = read.cytoband()$df
##D circos.genomicTrackPlotRegion(cytoband, stack = TRUE, panel.fun = function(region, value, ...) {
##D     circos.genomicRect(region, value, col = cytoband.col(value$V5), border = NA, ...)
##D }, track.height = 0.05)
##D 
##D circos.clear()
##D 
## End(Not run)




