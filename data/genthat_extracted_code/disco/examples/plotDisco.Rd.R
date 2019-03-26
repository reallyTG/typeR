library(disco)


### Name: plotDisco
### Title: plots log2FC of the corresponding genes against each other
### Aliases: plotDisco

### ** Examples

library(tmod)
data(tmod)
data(orthologs)
ds <- disco.score(orthologs)
plotDisco(orthologs, ds, tmod$MODULES2GENES[["LI.M1.0"]])



