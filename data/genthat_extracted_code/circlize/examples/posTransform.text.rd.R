library(circlize)


### Name: posTransform.text
### Title: Genomic position transformation function specifically for text
### Aliases: posTransform.text

### ** Examples

## Not run: 
##D 
##D op = par(no.readonly = TRUE)
##D 
##D set.seed(123458)
##D 
##D par(mfrow = c(2, 2))
##D 
##D bed = generateRandomBed(nr = 400, fun = function(k) rep("text", k))
##D bed = bed[-(9:13), ]
##D ##########################################
##D circos.par("start.degree" = 90, canvas.xlim = c(0, 1), canvas.ylim = c(0, 1), 
##D     gap.degree = 270, cell.padding = c(0, 0, 0, 0), track.margin = c(0.005, 0.005))
##D circos.initializeWithIdeogram(plotType = c("axis"), chromosome.index = "chr1")
##D circos.genomicTrackPlotRegion(bed, ylim = c(0, 1), 
##D     panel.fun = function(region, value, ...) {
##D         circos.genomicText(region, value, y = 0, labels.column = 1, 
##D             facing = "clockwise", adj = c(0, 0.5),
##D             posTransform = posTransform.text, cex = 0.8, niceFacing = F)
##D }, track.height = 0.1, bg.border = NA)
##D i_track = get.cell.meta.data("track.index")
##D 
##D circos.genomicPosTransformLines(bed, 
##D     posTransform = function(region, value) 
##D         posTransform.text(region, y = 0, labels = value[[1]], 
##D             cex = 0.8, track.index = i_track),
##D     direction = "outside"
##D )
##D 
##D circos.genomicTrackPlotRegion(bed, ylim = c(0, 1), 
##D     panel.fun = function(region, value, ...) {
##D         circos.points( (region[[1]] + region[[2]])/2, rep(0.5, nrow(region)), pch = 16)
##D }, track.height = 0.02, bg.border = NA)
##D 
##D circos.clear()
##D 
##D text(0, 0.05, "posTransform.text\ndirection = 'outside'", adj = c(0, 0))
##D 
##D ############################################
##D circos.par("start.degree" = 90, canvas.xlim = c(0, 1), canvas.ylim = c(0, 1), 
##D     gap.degree = 270, cell.padding = c(0, 0, 0, 0), track.margin = c(0.005, 0.005))
##D circos.initializeWithIdeogram(plotType = c("axis"), chromosome.index = "chr1")
##D circos.genomicTrackPlotRegion(bed, ylim = c(0, 1), 
##D     panel.fun = function(region, value, ...) {
##D         circos.genomicText(region, value, y = 0, labels.column = 1, 
##D             facing = "clockwise", adj = c(0, 0.5),
##D             posTransform = posTransform.default, cex = 0.8, niceFacing = F)
##D }, track.height = 0.1, bg.border = NA)
##D i_track = get.cell.meta.data("track.index")
##D 
##D circos.genomicPosTransformLines(bed, posTransform = posTransform.default, 
##D     direction = "outside")
##D 
##D circos.genomicTrackPlotRegion(bed, ylim = c(0, 1), 
##D     panel.fun = function(region, value, ...) {
##D         circos.points( (region[[1]] + region[[2]])/2, rep(0.5, nrow(region)), pch = 16)
##D }, track.height = 0.02, bg.border = NA)
##D 
##D circos.clear()
##D text(0, 0.05, "posTransform.default\ndirection = 'outside'", adj = c(0, 0))
##D 
##D ##############################################################################
##D circos.par("start.degree" = 90, canvas.xlim = c(0, 1), canvas.ylim = c(0, 1), 
##D     gap.degree = 270, cell.padding = c(0, 0, 0, 0), track.margin = c(0.005, 0.005))
##D circos.initializeWithIdeogram(plotType = c("axis"), chromosome.index = "chr1")
##D circos.par(cell.padding = c(0, 0, 0, 0))
##D circos.genomicTrackPlotRegion(bed, ylim = c(0, 1), 
##D     panel.fun = function(region, value, ...) {
##D         circos.points( (region[[1]] + region[[2]])/2, rep(0.5, nrow(region)), pch = 16)
##D }, track.height = 0.02, bg.border = NA)
##D 
##D circos.genomicTrackPlotRegion(bed, ylim = c(0, 1), track.height = 0.1, bg.border = NA)
##D i_track = get.cell.meta.data("track.index")
##D 
##D circos.genomicTrackPlotRegion(bed, ylim = c(0, 1), 
##D     panel.fun = function(region, value, ...) {
##D         circos.genomicText(region, value, y = 1, labels.column = 1, 
##D             facing = "clockwise", adj = c(1, 0.5),
##D             posTransform = posTransform.text, cex = 0.8, niceFacing = F)
##D }, track.height = 0.1, bg.border = NA)
##D 
##D circos.genomicPosTransformLines(bed, 
##D     posTransform = function(region, value) 
##D         posTransform.text(region, y = 1, labels = value[[1]], 
##D             cex = 0.8, track.index = i_track+1),
##D     direction = "inside", track.index = i_track
##D )
##D circos.clear()
##D text(0, 0.05, "posTransform.text\ndirection = 'inside'", adj = c(0, 0))
##D 
##D ##############################################################################
##D circos.par("start.degree" = 90, canvas.xlim = c(0, 1), canvas.ylim = c(0, 1), 
##D     gap.degree = 270, cell.padding = c(0, 0, 0, 0), track.margin = c(0.005, 0.005))
##D circos.initializeWithIdeogram(plotType = c("axis"), chromosome.index = "chr1")
##D circos.par(cell.padding = c(0, 0, 0, 0))
##D circos.genomicTrackPlotRegion(bed, ylim = c(0, 1), 
##D     panel.fun = function(region, value, ...) {
##D         circos.points( (region[[1]] + region[[2]])/2, rep(0.5, nrow(region)), pch = 16)
##D }, track.height = 0.02, bg.border = NA)
##D 
##D circos.genomicTrackPlotRegion(bed, ylim = c(0, 1), track.height = 0.1, bg.border = NA)
##D i_track = get.cell.meta.data("track.index")
##D 
##D circos.genomicTrackPlotRegion(bed, ylim = c(0, 1), 
##D     panel.fun = function(region, value, ...) {
##D         circos.genomicText(region, value, y = 1, labels.column = 1, facing = "clockwise", 
##D             adj = c(1, 0.5), posTransform = posTransform.text, cex = 0.8, 
##D             niceFacing = F, padding = 0.2)
##D }, track.height = 0.1, bg.border = NA)
##D 
##D 
##D circos.genomicPosTransformLines(bed, 
##D     posTransform = function(region, value) 
##D         posTransform.text(region, y = 1, labels = value[[1]], 
##D             cex = 0.8, track.index = i_track+1, padding = 0.2),
##D     direction = "inside", track.index = i_track
##D )
##D circos.clear()
##D text(0, 0.05, "posTransform.text\ndirection = 'inside'\npadding = 0.2", adj = c(0, 0))
##D 
##D par(op)
##D 
## End(Not run)




