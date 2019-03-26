library(lineup)


### Name: genepos
### Title: Genomic positions of genes in simulated expression data
### Aliases: genepos
### Keywords: datasets

### ** Examples

data(genepos)

# interplot genetic positions
library(qtl)
data(pmap)
data(f2cross)
genepos_interp <- interpPositions(genepos, pmap, pull.map(f2cross))
genepos[1:5,] # 'newpos' column is the interpolated cM position



