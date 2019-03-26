library(circlize)


### Name: circos.genomicRect
### Title: Draw rectangle-like grid, specifically for genomic graphics
### Aliases: circos.genomicRect

### ** Examples

## Not run: 
##D 
##D ############################
##D ### rect matrix
##D circos.par("track.height" = 0.1, cell.padding = c(0, 0, 0, 0))
##D circos.initializeWithIdeogram(plotType = NULL)
##D 
##D bed = generateRandomBed(nr = 100, nc = 4)
##D circos.genomicTrackPlotRegion(bed, stack = TRUE, panel.fun = function(region, value, ...) {
##D     circos.genomicRect(region, value, col = sample(1:10, nrow(region), replace = TRUE), 
##D         border = NA, ...)
##D     i = getI(...)
##D     cell.xlim = get.cell.meta.data("cell.xlim")
##D     #circos.lines(cell.xlim, c(i, i), lty = 2, col = "#00000040")
##D }, bg.border = NA)
##D 
##D circos.genomicPosTransformLines(bed, posTransform = posTransform.default,
##D     horizontalLine = "top")
##D 
##D circos.genomicTrackPlotRegion(bed, stack = TRUE, panel.fun = function(region, value, ...) {
##D     circos.genomicRect(region, value, col = sample(1:10, nrow(region), replace = TRUE), 
##D         border = NA, posTransform = posTransform.default, ...)
##D     i = getI(...)
##D     cell.xlim = get.cell.meta.data("cell.xlim")
##D     #circos.lines(cell.xlim, c(i, i), lty = 2, col = "#00000040")
##D }, bg.border = NA)
##D 
##D circos.genomicPosTransformLines(bed, posTransform = posTransform.default,
##D     direction = "outside", horizontalLine = "bottom")
##D 
##D circos.genomicTrackPlotRegion(bed, stack = TRUE, panel.fun = function(region, value, ...) {
##D     circos.genomicRect(region, value, col = sample(1:10, nrow(region), replace = TRUE), 
##D         border = NA, ...)
##D     i = getI(...)
##D     cell.xlim = get.cell.meta.data("cell.xlim")
##D     #circos.lines(cell.xlim, c(i, i), lty = 2, col = "#00000040")
##D }, bg.border = NA)
##D 
##D circos.clear()
##D 
##D ##########################
##D ### rect from bed list
##D circos.par("track.height" = 0.1, cell.padding = c(0, 0, 0, 0))
##D circos.initializeWithIdeogram(plotType = NULL)
##D 
##D bed1 = generateRandomBed(nr = 100)
##D bed2 = generateRandomBed(nr = 100)
##D bed_list = list(bed1, bed2)
##D f = colorRamp2(breaks = c(-1, 0, 1), colors = c("green", "black", "red"))
##D circos.genomicTrackPlotRegion(bed_list, stack = TRUE,
##D     panel.fun = function(region, value, ...) {
##D     
##D     circos.genomicRect(region, value, col = f(value[[1]]), 
##D         border = NA, ...)
##D     i = getI(...)
##D     cell.xlim = get.cell.meta.data("cell.xlim")
##D     circos.lines(cell.xlim, c(i, i), lty = 2, col = "#000000")
##D })
##D 
##D circos.genomicTrackPlotRegion(bed_list, ylim = c(0, 3),
##D     panel.fun = function(region, value, ...) {
##D     i = getI(...)
##D     circos.genomicRect(region, value, ytop = i+0.4, ybottom = i-0.4, col = f(value[[1]]), 
##D         border = NA, ...)
##D     
##D     cell.xlim = get.cell.meta.data("cell.xlim")
##D     circos.lines(cell.xlim, c(i, i), lty = 2, col = "#000000")
##D })
##D 
##D circos.genomicTrackPlotRegion(bed1, panel.fun = function(region, value, ...) {
##D     circos.genomicRect(region, value, col = "red", border = NA, ...)
##D 
##D })
##D 
##D circos.genomicTrackPlotRegion(bed_list, panel.fun = function(region, value, ...) {
##D     i = getI(...)
##D     circos.genomicRect(region, value, col = i, border = NA, ...)
##D 
##D })
##D 
##D circos.clear()
##D 
## End(Not run)




