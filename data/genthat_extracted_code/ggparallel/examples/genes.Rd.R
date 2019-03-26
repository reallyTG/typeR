library(ggparallel)


### Name: genes
### Title: Data linking genes and pathways.
### Aliases: genes
### Keywords: datasets

### ** Examples

library(ggplot2)
library(RColorBrewer)
genes$chrom <- factor(genes$chrom, levels=c(paste("chr", 1:22, sep=""),
  "chrX", "chrY"))
ggparallel(
  list("path", "chrom"),
  text.offset = c(0.03, 0,-0.03),
  data = genes,
  width = 0.1,
  order = c(1, 0),
  angle = 0,
  color = "white",
  factorlevels =  c(sapply(unique(genes$chrom), as.character),unique(genes$path))
) +
 scale_fill_manual(
   values = c(brewer.pal("YlOrRd", n = 9), rep("grey80", 24)),
   guide = "none"
 ) +
 scale_colour_manual(
   values = c(brewer.pal("YlOrRd", n = 9), rep("grey80", 24)),
   guide = "none"
 ) +
 coord_flip()



