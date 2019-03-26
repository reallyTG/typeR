library(circlize)


### Name: circos.initializeWithIdeogram
### Title: Initialize the circular layout with an ideogram
### Aliases: circos.initializeWithIdeogram

### ** Examples

## Not run: 
##D circos.initializeWithIdeogram()
##D 
##D cytoband.file = system.file(package = "circlize"),
##D     "extdata", "cytoBand.txt")
##D circos.initializeWithIdeogram(cytoband.file)
##D 
##D cytoband.df = read.table(cytoband.file, colClasses = c("character", "numeric",
##D     "numeric", "character", "character"), sep = "\t")
##D circos.initializeWithIdeogram(cytoband.df)
##D 
##D circos.initializeWithIdeogram(species = "hg18")
##D 
##D circos.initializeWithIdeogram(species = "mm10")
##D 
##D circos.initializeWithIdeogram(chromosome.index = c("chr1", "chr2"))
##D 
##D cytoband = read.table(cytoband.file, colClasses = c("character", "numeric",
##D     "numeric", "character", "character"), sep = "\t")
##D circos.initializeWithIdeogram(cytoband, sort.chr = FALSE)
##D 
##D cytoband[[1]] = factor(cytoband[[1]], levels = paste0("chr", c(22:1, "X", "Y")))
##D circos.initializeWithIdeogram(cytoband, sort.chr = FALSE)
##D 
##D cytoband = read.table(cytoband.file, colClasses = c("character", "numeric",
##D     "numeric", "character", "character"), sep = "\t")
##D circos.initializeWithIdeogram(cytoband, sort.chr = TRUE)
##D 
##D circos.initializeWithIdeogram(plotType = c("axis", "labels"))
##D 
##D circos.initializeWithIdeogram(plotType = NULL)
##D 
##D circos.par("start.degree" = 90)
##D circos.initializeWithIdeogram()
##D circos.clear()
##D 
##D circos.par("gap.degree" = rep(c(2, 4), 12))
##D circos.initializeWithIdeogram()
##D circos.clear()
## End(Not run)




