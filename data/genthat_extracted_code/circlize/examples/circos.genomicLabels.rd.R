library(circlize)


### Name: circos.genomicLabels
### Title: Add labels to specified genomic regions
### Aliases: circos.genomicLabels

### ** Examples

## Not run: 
##D circos.initializeWithIdeogram(plotType = c("labels", "axis"))
##D bed = generateRandomBed(nr = 100, fun = function(k) sample(letters, k, replace = TRUE))
##D bed[1, 4] = "aaaaaaaa"
##D circos.genomicLabels(bed, labels.column = 4, side = "inside",
##D     col = as.numeric(factor(bed[[1]])))
##D circos.genomicLabels(bed, labels.column = 4, side = "outside",
##D     line_col = as.numeric(factor(bed[[1]])))
## End(Not run)



