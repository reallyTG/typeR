library(circlize)


### Name: circos.genomicRainfall
### Title: Genomic rainfall plot
### Aliases: circos.genomicRainfall

### ** Examples

## Not run: 
##D load(system.file(package = "circlize", "extdata", "DMR.RData"))
##D 
##D # rainfall
##D circos.initializeWithIdeogram(plotType = c("axis", "labels"))
##D 
##D bed_list = list(DMR_hyper, DMR_hypo)
##D circos.genomicRainfall(bed_list, pch = 16, cex = 0.4, col = c("#FF000080", "#0000FF80"))
##D 
##D circos.genomicDensity(bed_list[[1]], col = c("#FF000080"), track.height = 0.1)
##D circos.genomicDensity(bed_list[[2]], col = c("#0000FF80"), track.height = 0.1)
##D 
##D circos.clear()
##D 
## End(Not run)




