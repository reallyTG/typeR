library(Seurat)


### Name: AugmentPlot
### Title: Augments ggplot2 scatterplot with a PNG image.
### Aliases: AugmentPlot

### ** Examples

## Not run: 
##D data("pbmc_small")
##D p <- PCAPlot(pbmc_small, do.return = TRUE)
##D ggsave(filename = 'pcaplot.png', plot = p, device = png)
##D pmod <- AugmentPlot(plot1 = p, imgFile = 'pcaplot.png')
##D pmod
## End(Not run)



