library(circlize)


### Name: circos.genomicHeatmap
### Title: Add heatmaps for selected regions
### Aliases: circos.genomicHeatmap

### ** Examples

## Not run: 
##D circos.initializeWithIdeogram(plotType = c("labels", "axis"))
##D bed = generateRandomBed(nr = 100, nc = 4)
##D col_fun = colorRamp2(c(-1, 0, 1), c("green", "black", "red"))
##D circos.genomicHeatmap(bed, col_fun, side = "inside", border = "white")
##D circos.genomicHeatmap(bed, col_fun, side = "outside", 
##D     line_col = as.numeric(factor(bed[[1]])))
## End(Not run)



