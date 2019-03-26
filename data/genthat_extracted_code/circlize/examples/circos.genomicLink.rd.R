library(circlize)


### Name: circos.genomicLink
### Title: Add links from two sets of genomic positions
### Aliases: circos.genomicLink

### ** Examples

## Not run: 
##D set.seed(123)
##D 
##D bed1 = generateRandomBed(nr = 100)
##D bed1 = bed1[sample(nrow(bed1), 20), ]
##D bed2 = generateRandomBed(nr = 100)
##D bed2 = bed2[sample(nrow(bed2), 20), ]
##D circos.par("track.height" = 0.1, cell.padding = c(0, 0, 0, 0))
##D circos.initializeWithIdeogram()
##D 
##D circos.genomicLink(bed1, bed2, col = sample(1:5, 20, replace = TRUE), border = NA)
##D circos.clear()
##D 
## End(Not run)




