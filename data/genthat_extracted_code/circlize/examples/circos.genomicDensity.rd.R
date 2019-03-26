library(circlize)


### Name: circos.genomicDensity
### Title: Calculate and add genomic density track
### Aliases: circos.genomicDensity

### ** Examples

## Not run: 
##D 
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




